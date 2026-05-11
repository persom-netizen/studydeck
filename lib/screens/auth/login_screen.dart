import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/routes.dart';
import '../../providers/auth_provider.dart';
import '../../providers/connectivity_provider.dart';
import '../../services/auth_service.dart';
import '../../theme/colors.dart';
import '../../utils/validators.dart';

/// Login screen with email/password authentication and connectivity indicator.
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final notifier = ref.read(authNotifierProvider.notifier);
    final success = await notifier.signIn(
      _emailController.text.trim(),
      _passwordController.text,
    );
    if (!mounted) return;
    if (success) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.dashboard);
    } else {
      final error = ref.read(authNotifierProvider).error;
      final message = error is AuthException
          ? Validators.authError(error.code)
          : 'An error occurred. Please try again.';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red.shade700,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final isLoading = authState is AsyncLoading;
    final connectivity = ref.watch(connectivityProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              _buildHeader(),
              const SizedBox(height: 12),
              _ConnectivityChip(connectivity: connectivity),
              const SizedBox(height: 36),
              _buildForm(isLoading),
              const SizedBox(height: 24),
              _buildLoginButton(isLoading),
              const SizedBox(height: 20),
              _buildSignupLink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Study Deck',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Welcome back! Please sign in.',
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey.shade600,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }

  Widget _buildForm(bool isLoading) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            enabled: !isLoading,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: _inputDecoration(
              label: 'Email',
              hint: 'you@example.com',
              icon: Icons.email_outlined,
            ),
            validator: Validators.email,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            enabled: !isLoading,
            obscureText: _obscurePassword,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _submit(),
            decoration: _inputDecoration(
              label: 'Password',
              hint: '••••••••',
              icon: Icons.lock_outline,
            ).copyWith(
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.grey,
                ),
                onPressed: () =>
                    setState(() => _obscurePassword = !_obscurePassword),
              ),
            ),
            validator: (v) =>
                v == null || v.isEmpty ? 'Password is required' : null,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton(bool isLoading) {
    return FilledButton(
      onPressed: isLoading ? null : _submit,
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: Colors.white,
              ),
            )
          : const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
    );
  }

  Widget _buildSignupLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.grey.shade600, fontFamily: 'Poppins'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pushNamed(AppRoutes.signup),
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(icon, color: AppColors.primary),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.primary, width: 2),
      ),
      filled: true,
      fillColor: Colors.grey.shade50,
    );
  }
}

/// Small chip that reflects the current network connectivity state.
class _ConnectivityChip extends StatelessWidget {
  const _ConnectivityChip({required this.connectivity});

  final AsyncValue<bool> connectivity;

  @override
  Widget build(BuildContext context) {
    return connectivity.when(
      loading: () => const _StatusChip(
        icon: Icons.wifi_find_outlined,
        label: 'Checking connection…',
        color: Colors.orange,
      ),
      error: (_, __) => const _StatusChip(
        icon: Icons.wifi_off_outlined,
        label: 'Unable to check connection',
        color: Colors.red,
      ),
      data: (connected) => connected
          ? const _StatusChip(
              icon: Icons.cloud_done_outlined,
              label: 'Connected',
              color: Colors.green,
            )
          : const _StatusChip(
              icon: Icons.cloud_off_outlined,
              label: 'No internet connection',
              color: Colors.red,
            ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

/// User profile form fields reused by onboarding and settings.
class UserFormWidget extends StatelessWidget {
  const UserFormWidget({
    super.key,
    required this.fullNameController,
    required this.usernameController,
  });

  final TextEditingController fullNameController;
  final TextEditingController usernameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: fullNameController,
          decoration: const InputDecoration(labelText: 'Full Name'),
        ),
        TextFormField(
          controller: usernameController,
          decoration: const InputDecoration(labelText: 'Username'),
        ),
      ],
    );
  }
}

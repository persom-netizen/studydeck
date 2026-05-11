/// Represents an authenticated user in the local auth system.
class AuthUser {
  const AuthUser({required this.id, required this.email});

  final String id;
  final String email;
}

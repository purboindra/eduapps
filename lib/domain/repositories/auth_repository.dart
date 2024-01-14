import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  Future<AuthResponse?> signUp(
      {required String email,
      required String password,
      required String username});

  Future<AuthResponse?> signIn({
    required String email,
    required String password,
  });

  Future<User?> getCurrentUser();
}

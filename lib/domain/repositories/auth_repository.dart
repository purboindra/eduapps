import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  Future<AuthResponse?> signUp(
      {required String email,
      required String password,
      required String username,
      List<int>? coursesId});

  Future<AuthResponse?> signIn({
    required String email,
    required String password,
  });
  Future<User?> getCurrentUser();
  Future<void> signOut();
  Future<void> storeUserToDatabase(User user);
}

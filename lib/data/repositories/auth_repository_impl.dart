import 'package:education_app/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<AuthResponse?> signUp(
      {required String email,
      required String password,
      required String username}) async {
    final response = await Supabase.instance.client.auth
        .signUp(password: password, email: email, data: {
      "username": username,
    });

    final user = response.user;

    await Supabase.instance.client.from("user").insert({
      "uid": user?.id,
      "password": password,
      "email": email,
      "user_name": username,
      "created_at": user?.createdAt,
      "age": 23,
      "education_status": "student",
    });

    return response;
  }

  @override
  Future<AuthResponse?> signIn(
      {required String email, required String password}) async {
    final response = await Supabase.instance.client.auth
        .signInWithPassword(password: password, email: email);
    return response;
  }

  @override
  Future<User?> getCurrentUser() async {
    final user = Supabase.instance.client.auth.currentUser;
    return user;
  }

  @override
  Future<void> signOut() async {
    await Supabase.instance.client.auth.signOut();
  }
}

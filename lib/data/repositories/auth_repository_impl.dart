import 'package:education_app/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<AuthResponse?> signUp(
      {required String email,
      required String password,
      required String username,
      List<int>? coursesId}) async {
    final response = await Supabase.instance.client.auth
        .signUp(password: password, email: email, data: {
      "username": username,
      "password": password,
      "courses": coursesId,
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
    await Supabase.instance.client.auth.signOut(scope: SignOutScope.global);
  }

  @override
  Future<void> storeUserToDatabase(User user) async {
    await Supabase.instance.client.from("user").insert({
      "uid": user.id,
      "password": user.userMetadata!["password"],
      "email": user.email,
      "user_name": user.userMetadata!["username"],
      "created_at": user.createdAt,
      "age": 23,
      "education_status": "student",
      "courses": user.userMetadata!["courses"]
    });
  }

  @override
  Future<bool> isFirstInstall() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("is_first_install") ?? true;
  }
}

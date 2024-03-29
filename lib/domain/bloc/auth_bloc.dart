import 'package:education_app/app/utils/app_print.dart';
import 'package:education_app/domain/bloc/base_bloc.dart';
import 'package:education_app/domain/event/auth_event.dart';
import 'package:education_app/domain/repositories/auth_repository.dart';
import 'package:education_app/domain/state/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepository) : super(InitialAuthState()) {
    on<SignUpEvent>(_handleSignUp);
    on<SignInEvent>(_handleSignIn);
    on<GetCurrentUserEvent>(_handleGetCurrentUser);
    on<CheckuserAlreadyLoggedInEvent>(_handleCheckUserAlreadyLoggedIn);
    on<SignOutEvent>(_handleSignOut);
  }

  void _handleSignOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    try {
      await authRepository.signOut();
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool("is_first_install", false);
      emit(SuccessSignOutState());
    } catch (e) {
      AppPrint.erroLog("ERROR SIGN OUT $e");
      emit(InitialAuthState());
    }
  }

  void _handleCheckUserAlreadyLoggedIn(
      CheckuserAlreadyLoggedInEvent event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    try {
      final user = await authRepository.getCurrentUser();

      final isFirstInstall = await authRepository.isFirstInstall();
      emit(
        CheckUserAlreadyLoggedInState(user != null, isFirstInstall),
      );
    } catch (e) {
      AppPrint.erroLog("ERROR FROM CHECK USER ALREADY LOGGED IN $e");
      emit(InitialAuthState());
    }
  }

  void _handleGetCurrentUser(
      GetCurrentUserEvent event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    try {
      final user = await authRepository.getCurrentUser();
      if (user != null) {
        emit(SuccessGetCurrentUserState(user));
      } else {
        throw Exception("Error get current user");
      }
    } catch (e) {
      AppPrint.erroLog("ERROR FROM GET CURRENT USER $e");
    }
  }

  void _handleSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    try {
      final response = await authRepository.signIn(
        email: event.email,
        password: event.password,
      );
      if (response != null) {
        emit(SuccessSignInState(response));
      } else {
        throw Exception("Sorry, something went wrong!");
      }
    } catch (e) {
      emit(ErrorSignInState(e.toString()));
    } finally {
      emit(InitialAuthState());
    }
  }

  void _handleSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    try {
      final response = await authRepository.signUp(
          email: event.email,
          password: event.password,
          username: event.username,
          coursesId: event.coursesId);
      if (response != null) {
        await authRepository.storeUserToDatabase(response.user!);
        emit(SuccessSignUpState(response));
      } else {
        throw Exception("Sorry, something went wrong!");
      }
    } catch (e) {
      emit(ErrorSignUpState(e.toString()));
    }
  }

  final AuthRepository authRepository;
}

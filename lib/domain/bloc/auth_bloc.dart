import 'package:education_app/domain/bloc/base_bloc.dart';
import 'package:education_app/domain/event/auth_event.dart';
import 'package:education_app/domain/repositories/auth_repository.dart';
import 'package:education_app/domain/state/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepository) : super(InitialAuthState()) {
    on<SignUpEvent>(_handleSignUp);
    on<SignInEvent>(_handleSignIn);
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
          username: event.username);
      if (response != null) {
        emit(SuccessSignUpState(response));
      } else {
        throw Exception("Sorry, something went wrong!");
      }
    } catch (e) {
      emit(ErrorSignUpState(e.toString()));
    } finally {
      emit(InitialAuthState());
    }
  }

  final AuthRepository authRepository;
}

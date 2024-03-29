import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

sealed class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

final class InitialAuthState extends AuthState {}

final class LoadingAuthState extends AuthState {}

final class ErrorSignInState extends AuthState {
  final String errorMessage;

  ErrorSignInState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

final class ErrorSignUpState extends AuthState {
  final String errorMessage;

  ErrorSignUpState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

final class SuccessSignUpState extends AuthState {
  final AuthResponse authResponse;

  SuccessSignUpState(this.authResponse);

  @override
  List<Object> get props => [authResponse];
}

final class SuccessSignInState extends AuthState {
  final AuthResponse authResponse;

  SuccessSignInState(this.authResponse);

  @override
  List<Object> get props => [authResponse];
}

final class SuccessGetCurrentUserState extends AuthState {
  final User user;

  SuccessGetCurrentUserState(this.user);

  @override
  List<Object> get props => [user];
}

final class CheckUserAlreadyLoggedInState extends AuthState {
  final bool isLogIn;
  final bool isFirstInstall;
  CheckUserAlreadyLoggedInState(this.isLogIn, this.isFirstInstall);

  @override
  List<Object> get props => [isLogIn, isFirstInstall];
}

final class SuccessSignOutState extends AuthState {
  SuccessSignOutState();

  @override
  List<Object> get props => [];
}

import 'package:equatable/equatable.dart';

sealed class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String username;
  final List<int>? coursesId;

  SignUpEvent(
    this.email,
    this.password,
    this.username,
    this.coursesId,
  );

  @override
  List<Object> get props => [email, password, username, coursesId ?? []];
}

final class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

final class GetCurrentUserEvent extends AuthEvent {
  GetCurrentUserEvent();

  @override
  List<Object> get props => [];
}

final class CheckuserAlreadyLoggedInEvent extends AuthEvent {
  CheckuserAlreadyLoggedInEvent();

  @override
  List<Object> get props => [];
}

final class SignOutEvent extends AuthEvent {
  SignOutEvent();

  @override
  List<Object> get props => [];
}

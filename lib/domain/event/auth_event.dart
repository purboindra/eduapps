import 'package:equatable/equatable.dart';

sealed class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String username;

  SignUpEvent(this.email, this.password, this.username);

  @override
  List<Object> get props => [email, password, username];
}

final class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

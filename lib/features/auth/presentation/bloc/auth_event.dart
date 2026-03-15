import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class CheckAuthStatusEvent extends AuthEvent {}

class LoginRequestedEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginRequestedEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class SignUpRequestedEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  const SignUpRequestedEvent(this.name, this.email, this.password);

  @override
  List<Object?> get props => [name, email, password];
}

class LogoutRequestedEvent extends AuthEvent {}

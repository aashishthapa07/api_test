import 'package:api_test/model/user/user_model.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final UserModel user;

  LoginEvent(this.user);
}

class SignupEvent extends AuthEvent {
  final UserModel user;

  SignupEvent(this.user);
}

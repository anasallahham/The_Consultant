//import 'package:project/model/login_model.dart';

abstract class LoginState{}

class InitState extends LoginState{}


class LoadingState extends LoginState{}


class LoginSuccess extends LoginState{
  // final LoginModel loginModel;

 // LoginSuccess(this.loginModel);
}
class Success extends LoginState{}

class ErrorState extends LoginState{}

class ChangePassword extends LoginState{}


class PasswordSuccess extends LoginState{}









import 'package:gaith/Features/Auth/Login/Model/user_login_model.dart';

abstract class LoginViewState {}

class InitializeLoginViewState extends LoginViewState{}

class LoginViewStateLoading extends LoginViewState{}
class LoginViewStateSuccess extends LoginViewState{

   UserLoginModel? userLoginModel;
   LoginViewStateSuccess(this.userLoginModel);
}
class LoginViewStateError extends LoginViewState{

  final String error;
  LoginViewStateError(this.error);
}
class ChangeIconPasswordSuccess extends LoginViewState{}




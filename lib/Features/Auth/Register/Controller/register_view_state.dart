







import 'package:gaith/Features/Auth/Register/Model/register_model.dart';

abstract class RegisterViewState {}

class InitializeRegisterViewState extends RegisterViewState{}

class RegisterViewStateLoading extends RegisterViewState{}
class RegisterViewStateSuccess extends RegisterViewState{

   RegisterModel? registerModel;
   RegisterViewStateSuccess(this.registerModel);
}
class RegisterViewStateError extends RegisterViewState{

  final String error;
  RegisterViewStateError(this.error);
}
class ChangeIconPasswordSuccess extends RegisterViewState{}




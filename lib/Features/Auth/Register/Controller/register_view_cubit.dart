










import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaith/Features/Auth/Register/Controller/register_view_state.dart';
import 'package:gaith/Features/Auth/Register/Model/register_model.dart';
import 'package:gaith/core/sharde/dioHelper.dart';

class RegisterViewCubit extends Cubit<RegisterViewState>{
  RegisterViewCubit():super(InitializeRegisterViewState());

  bool isPassword=true;
  IconData subfix= Icons.visibility_off;
  void changIconPassword()
  {
    isPassword=!isPassword;
    subfix=isPassword?Icons.visibility_off:Icons.visibility;
    emit(ChangeIconPasswordSuccess());
  }


  RegisterModel? registerModel;
  void userRegister({
    required String name,required String email,
    required String password,required String password_confirmation,
    required String phone,required String address })
  {
    emit(RegisterViewStateLoading ());
    DioHelper.postData(url:'register' , data: {
      'name':name,
      'email':email,
      'password':password,
      'password_confirmation':password_confirmation,
      'phone':phone,
      'address':address



    }).then((value){
print(value.data);
registerModel = RegisterModel.fromJson(value.data);
print(registerModel!.status);
print(registerModel!.message);



       emit(RegisterViewStateSuccess(registerModel!));
    }).catchError((error){
      print(error.toString());
      emit(RegisterViewStateError(error.toString()));
    });
  }





}



  
  

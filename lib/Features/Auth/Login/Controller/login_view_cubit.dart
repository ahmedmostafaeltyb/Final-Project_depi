
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaith/Features/Auth/Login/Controller/login_view_state.dart';
import 'package:gaith/Features/Auth/Login/Model/user_login_model.dart';
import 'package:gaith/core/sharde/dioHelper.dart';



UserLoginModel? userLoginModel;

class LoginViewCubit extends Cubit<LoginViewState> {
  LoginViewCubit() : super(InitializeLoginViewState());

  bool isPassword = true;
  IconData subfix = Icons.visibility_off;

  void userLogin({required String email, required String password}) {
    emit(LoginViewStateLoading());
    DioHelper.postData(url: 'login', data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value.data);
      userLoginModel = UserLoginModel.fromJson(value.data);

      emit(LoginViewStateSuccess(userLoginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(LoginViewStateError(error.toString()));
    });
  }










  void changIconPassword() {
    isPassword = !isPassword;
    subfix = isPassword ? Icons.visibility_off : Icons.visibility;
    emit(ChangeIconPasswordSuccess());
  }


}

import 'package:gaith/Features/Auth/login/model/user_login_data_model.dart';

class UserLoginModel {
  bool? status;
  String? message;
  UserDataLoginModel? user;
  String? token;

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new UserDataLoginModel.fromJson(json['user']) : null;
    token = json['token'];
  }
}
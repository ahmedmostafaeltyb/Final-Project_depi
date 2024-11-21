class ProfileModel {
  bool? status;
  String? message;
  User? user;



  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }



}

class User {
  int? id;
  dynamic? img;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? lang;



  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    lang = json['lang'];
  }


}
class UserDataLoginModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? lang;


  UserDataLoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    lang = json['lang'];
  }
}
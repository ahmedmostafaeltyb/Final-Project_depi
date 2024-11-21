class EditProfileModel{
  int? status;
  String? message;



  EditProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }



}


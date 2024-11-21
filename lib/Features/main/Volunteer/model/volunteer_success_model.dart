class VolunteerSuccessModel {
 dynamic status;
  String? message;
  VolunteerSuccessModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }


}
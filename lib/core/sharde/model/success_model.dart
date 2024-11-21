class SuccessModel {
  dynamic status;
  String? message;
  SuccessModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }


}
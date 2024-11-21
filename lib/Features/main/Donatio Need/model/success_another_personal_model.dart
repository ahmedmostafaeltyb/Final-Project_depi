class SuccessAnotherModel {
  dynamic status;
  String? message;
  SuccessAnotherModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }


}
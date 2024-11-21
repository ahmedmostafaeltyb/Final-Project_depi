class SuccessMeModel {
  dynamic status;
  String? message;
  SuccessMeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }


}
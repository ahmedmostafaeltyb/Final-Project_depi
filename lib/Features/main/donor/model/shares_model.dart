class SharesModel {
  int? status;
  String? message;
  List<Shares>? shares;



  SharesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['Shares'] != null) {
      shares = <Shares>[];
      json['Shares'].forEach((v) {
        shares!.add(new Shares.fromJson(v));
      });
    }
  }


}

class Shares {
  int? id;
  String? img;
  String? name;
  String? dec;
  String? price;
  String? pay;



  Shares.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    name = json['name'];
    dec = json['dec'];
    price = json['price'];
    pay = json['pay'];
  }


}
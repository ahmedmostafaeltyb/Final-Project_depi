class CartModel {
  int? status;
  String? message;
  String? total;
  List<Carts>? carts;

  CartModel({this.status, this.message, this.total, this.carts});

  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    total = json['total'];
    if (json['Carts'] != null) {
      carts = <Carts>[];
      json['Carts'].forEach((v) {
        carts!.add(new Carts.fromJson(v));
      });
    }
  }


}

class Carts {
  String?name;
  int? id;
  String? img;
  int? price;

  Carts({this.id, this.img, this.price});

  Carts.fromJson(Map<String, dynamic> json) {
    name=json['name'];
    id = json['id'];
    img = json['img'];
    price = json['price'];
  }


}
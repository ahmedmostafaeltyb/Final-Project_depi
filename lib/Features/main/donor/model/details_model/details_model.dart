class DetailsModel {
  dynamic? status;
  String? message;
  Donation? donation;



  DetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    donation = json['donation'] != null
        ? new Donation.fromJson(json['donation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.donation != null) {
      data['donation'] = this.donation!.toJson();
    }
    return data;
  }
}

class Donation {
  int? id;
  String? img;
  String? name;
  String? address;
  String? phone;
  String? des;
  String? price;
  String? pay;



  Donation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    des = json['des'];
    price = json['price'];
    pay = json['pay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img'] = this.img;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['des'] = this.des;
    data['price'] = this.price;
    data['pay'] = this.pay;
    return data;
  }
}
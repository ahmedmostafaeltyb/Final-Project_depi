class DonationsModel {
  int? id;
  String? img;
  String? name;
  String? catigoryAr;
  String? catigoryEn;
  String? address;
  String? phone;
  String? dec;
  String? price;
  String? pay;



  DonationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    name = json['name'];
    catigoryAr = json['catigory_ar'];
    catigoryEn = json['catigory_en'];
    address = json['address'];
    phone = json['phone'];
    dec = json['dec'];
    price = json['price'];
    pay = json['pay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img'] = this.img;
    data['name'] = this.name;
    data['catigory_ar'] = this.catigoryAr;
    data['catigory_en'] = this.catigoryEn;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['dec'] = this.dec;
    data['price'] = this.price;
    data['pay'] = this.pay;
    return data;
  }
}
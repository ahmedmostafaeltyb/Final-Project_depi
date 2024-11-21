class Catigory {
  int? id;
  String? img;
  String? nameAr;
  String? nameEn;



  Catigory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img'] = this.img;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    return data;
  }
}
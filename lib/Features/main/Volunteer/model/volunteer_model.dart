class VolunteerModel {
  dynamic status;
  String? message;
  List<Volunteers>? volunteers;

  VolunteerModel({this.status, this.message, this.volunteers});

  VolunteerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['volunteers'] != null) {
      volunteers = <Volunteers>[];
      json['volunteers'].forEach((v) {
        volunteers!.add(new Volunteers.fromJson(v));
      });
    }
  }


}

class Volunteers {
  int? id;
  String? img;
  String? name;
  String? dec;

  Volunteers({this.id, this.img, this.name, this.dec});

  Volunteers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    name = json['name'];
    dec = json['dec'];
  }
}
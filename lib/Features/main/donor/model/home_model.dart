import 'package:gaith/Features/main/donor/model/donation_model.dart';

import 'advertisements.dart';
import 'category_model.dart';

class DonorModel {
  int? status;
  String? message;
  List<Advertisements>? advertisements;
  List<Catigory>? catigory;
  List<DonationsModel>? donations;



  DonorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['advertisements'] != null) {
      advertisements = <Advertisements>[];
      json['advertisements'].forEach((v) {
        advertisements!.add(new Advertisements.fromJson(v));
      });
    }
    if (json['Catigory'] != null) {
      catigory = <Catigory>[];
      json['Catigory'].forEach((v) {
        catigory!.add(new Catigory.fromJson(v));
      });
    }
    if (json['Donations'] != null) {
      donations = <DonationsModel>[];
      json['Donations'].forEach((v) {
        donations!.add(new DonationsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.advertisements != null) {
      data['advertisements'] =
          this.advertisements!.map((v) => v.toJson()).toList();
    }
    if (this.catigory != null) {
      data['Catigory'] = this.catigory!.map((v) => v.toJson()).toList();
    }
    if (this.donations != null) {
      data['Donations'] = this.donations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}






import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaith/core/sharde/dioHelper.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/sharde/function/upload_image_to_api.dart';
import '../model/success_another_personal_model.dart';
import '../model/success_me_model.dart';
import 'donation_need_state.dart';

class DonationNeedViewCubit extends Cubit<DonationNeedViewState>{
  DonationNeedViewCubit():super(InitializeDonationNeedViewState());

  SuccessMeModel?successMeModel;
  void requestADonationForMe ({required String categoryId,
    required String description ,
    required String price , required String details,  dynamic image })  async {

emit(RequestADonationForMeStateLoading());

FormData formData = FormData.fromMap({
  'img': (image==null)?null:await uploadImageToAPI(image),
  'catigory_id': '16',
  'dec': description,
  'price': price,
  'des': details,


});

    DioHelper.postData(url:'need_donation_me',data:formData )

        .then((value){
print(value.data);
print(image);
successMeModel=SuccessMeModel.fromJson(value.data);
print(successMeModel!.message);
      emit(RequestADonationForMeStateSuccess(successMeModel));


    }).catchError((error)

    {
     print('Error in cubit requestADonationForMe ${error.toString()} ');
      emit(RequestADonationForMeStateError(error.toString()));

    }
    );

  }

  XFile? donationPhoto;
  var pickerPhoto = ImagePicker();

  Future getProfileImageByCamera() async {
    emit(PhotoDonationLoadingState());
    final pickedFile = await pickerPhoto.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      donationPhoto = XFile(pickedFile.path );
      emit(PhotoDonationSuccessState());
    } else {
      print('no image selected');
      emit(PhotoDonationErrorState());
    }
  }
  Future getProfileImageByGallery() async {
    emit(PhotoDonationLoadingState());
    final pickedFile = await pickerPhoto.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      donationPhoto = XFile(pickedFile.path );
      emit(PhotoDonationSuccessState());
    } else {
      print('no image selected');
      emit(PhotoDonationErrorState());
    }
  }

  SuccessAnotherModel?successAnotherModel;
  Future<void> requestADonationToAnotherPerson ({
    required String  name,
    required String address,
    required String phone,
    required String categoryId,
    required String description ,
    required String price ,
    dynamic  imageUrl,
    required String details  }) async {

    emit(RequestADonationToAnotherPersonStateLoading());
    FormData formData = FormData.fromMap({

      'img':(imageUrl==null)?null:await uploadImageToAPI(imageUrl),
      'catigory_id': '14',
      'dec': description,
      'price': price,
      'des': description,
      'name':name,
      'address':address,
      'phone':phone,
    });
    DioHelper.postData(url:'need_donation_you',data:formData)

        .then((value){
print(value.data);
print(imageUrl);
successAnotherModel=SuccessAnotherModel.fromJson(value.data);
      emit(RequestADonationToAnotherPersonStateSuccess(successAnotherModel));


    }).catchError((error)

    {
      print('Error in cubit requestADonationForMe ${error.toString()} ');
      emit(RequestADonationToAnotherPersonStateError(error.toString()));

    }
    );

  }

}

import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gaith/core/sharde/app_assets.dart';
import 'package:gaith/Features/main/Donatio%20Need/model/success_me_model.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/sharde/dioHelper.dart';
import '../../../../core/sharde/function/upload_image_to_api.dart';
import '../../../../core/sharde/model/success_model.dart';
import '../model/cart_model.dart';
import '../model/details_model/details_model.dart';
import '../model/home_model.dart';
import '../model/shares_model.dart';
import 'home_view_state.dart';

class DonorViewCubit extends Cubit<DonorViewState> {
  DonorViewCubit() : super(InitializeDonorViewState());
  DonorModel?donorModel;
  getHomeData() {
    emit(DonorViewStateLoading());
    DioHelper.getData(url: 'home')
        .then((value) {

          donorModel=DonorModel.fromJson(value.data);
          print(donorModel!.message);
          print(value.data);
      emit(DonorViewStateSuccess());
    })
        .catchError((error) {
      print('Error     ${error.toString()}');
      emit(DonorViewStateError(error.toString()));
    });
  }
  DetailsModel?detailsModel;
void getDetail({required int id}){

  emit(DetailsStateLoading());
  DioHelper.getData(url: 'get_donation/${id}')
      .then((value) {
    print('Successs');
    detailsModel=DetailsModel.fromJson(value.data);
    print( detailsModel!.message);
    print(value.data);
    emit(DetailsStateSuccess());
  })
      .catchError((error) {
    print('Error     ${error.toString()}');
    emit(DetailsStateError(error.toString()));
  });

}

int _currentPage=0;
void onPageChanged({required int index}){
  _currentPage=index;
  emit(ChangeSuccess());

}

  SharesModel?shareModel;
void  getSharesData() {
  emit(ShareViewStateLoading());
  DioHelper.getData(url: 'get_share')
      .then((value) {

    shareModel=SharesModel.fromJson(value.data);
    print(shareModel!.message);
    print(value.data);
    emit(ShareViewStateSuccess());
  })
      .catchError((error) {
    print('Error     ${error.toString()}');
    emit(ShareViewStateError(error.toString()));
  });
}
  int currentItem=0;
void changeBottomItem({required int index}){
  currentItem=index;
  emit(ChangeItemStateSuccess());
}
  DonorModel?donorByCategoryIdModel;
void getDonationsByCategory({required dynamic categoryId}){

  emit(DonationsByCategoryStateLoading());
  DioHelper.getData(url: 'get_donations_by_catigory/$categoryId')
      .then((value) {

    donorByCategoryIdModel=DonorModel.fromJson(value.data);
    print(donorByCategoryIdModel!.message);
    print(value.data);
    emit(DonationsByCategoryStateSuccess());
  })
      .catchError((error) {
    print('Error     ${error.toString()}');
    emit(DonationsByCategoryStateError(error.toString()));
  });
}

void addCart( {required int donationId}){

  emit(AddCartStateLoading());
  DioHelper.getData(url: 'add_cart/${donationId}')
      .then((value) {
print('Addd Sucesss');

    print(value.data);
Fluttertoast.showToast(
    msg: 'تمت الاضافة الى السلة',
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    fontSize: 16.0);
    emit(AddCartStateSuccess());
  })
      .catchError((error) {
    print('Error     ${error.toString()}');
    emit(AddCartStateError(error.toString()));
  });
}

  CartModel?cartModel;
void getCartAll(){

  emit(GetCartAllStateLoading());
  DioHelper.getData(url: 'get_cart')
      .then((value) {

cartModel=CartModel.fromJson(value.data);
    print(value.data);
    emit(GetCartAllStateSuccess());
  })
      .catchError((error) {
    print('Error     ${error.toString()}');
    emit(GetCartAllStateError(error.toString()));
  });

}

  void deleteItemInCart({required int donationId}){

    emit(deleteItemCartStateLoading());
    DioHelper.getData(url: 'delete_cart/${donationId}')
        .then((value) {
      emit(deleteItemCartStateSuccess());

      print(value.data);
      emit(deleteItemCartStateSuccess());
    })
        .catchError((error) {
      print('Error     ${error.toString()}');
      emit(deleteItemCartStateError(error.toString()));
    });

  }

  XFile? addDonationPhoto;
  var pickerPhoto = ImagePicker();

  Future getProfileImageByCamera() async {
    emit(PhotoAddPickerDonationLoadingState());
    final pickedFile = await pickerPhoto.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      addDonationPhoto = XFile(pickedFile.path );
      emit(PhotoAddPickerDonationSuccessState());
    } else {
      print('no image selected');
      emit(PhotoAddPickerDonationErrorState());
    }
  }
  Future getProfileImageByGallery() async {
    emit(PhotoAddPickerDonationLoadingState());
    final pickedFile = await pickerPhoto.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      addDonationPhoto = XFile(pickedFile.path );
      emit(PhotoAddPickerDonationSuccessState());
    } else {
      print('no image selected');
      emit(PhotoAddPickerDonationErrorState());
    }
  }
  SuccessModel?successModel;
  Future<void> AddDonation({
  required String catigory_id,
  required String name,
  required String phone,
  required String address,
  required String des,
   required dynamic context,
   dynamic image ,


  }) async {
  emit(AddDonationStateLoading());
  FormData formData = FormData.fromMap({

    'img': (image==null)?null:await uploadImageToAPI(image??null),
    'catigory_id': catigory_id,
    'name': name,
    'phone': phone,
    'address': address,
    'dec': des,
    'price': '0',
    'des': des
  });
    DioHelper.postData(url: 'add_donations_new', data:formData ).then((value) {
      print(value.data);


      successModel=SuccessModel.fromJson(value.data);
      emit(AddDonationStateSuccess(successModel!));
    }).catchError((error) {

      print('Error');
print(error.toString());
    emit(AddDonationStateError());
    });
  }

  // DonorModel?donorModelAll;
  // void getDonationsStayAll(){
  //
  //   emit(DonationsAllStateLoading());
  //   DioHelper.getData(url: 'get_donations_by_catigory/$categoryId')
  //       .then((value) {
  //
  //     donorByCategoryIdModel=DonorModel.fromJson(value.data);
  //     print(donorByCategoryIdModel!.message);
  //     print(value.data);
  //     emit(DonationsAllStateSuccess());
  //   })
  //       .catchError((error) {
  //     print('Error     ${error.toString()}');
  //     emit(DonationsAllStateError(error.toString()));
  //   });
  // }





}

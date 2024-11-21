

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaith/Features/Auth/profile/Controller/profile_view_state.dart';

import 'package:gaith/core/sharde/dioHelper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/sharde/function/upload_image_to_api.dart';
import '../model/edit_profile_model.dart';
import '../model/profile_model.dart';

class ProfileViewCubit extends Cubit<ProfileViewState>{
  ProfileViewCubit():super(InitializeProfileViewState());


  ProfileModel?profileModel;
  void getDataProfile(){
    emit(ProfileViewStateLoading());
    DioHelper.getData(url: 'get_profile').then((value){

      profileModel=ProfileModel.fromJson(value.data);
     print(value.data);

      emit(ProfileViewStateSuccess());
    }).catchError((error)

    {

      print('Error this is Get Profile ${error.toString()}');

      emit(ProfileViewStateError());
    }
    );
    
    
  }

  EditProfileModel ?editProfileModel;
  Future<void> editeProfileData({
    required String name,required String phone,
    required String email, dynamic image ,context}) async {
    emit(EditProfileViewStateLoading());
    FormData formData = FormData.fromMap({

      'img': await uploadImageToAPI(image??null),
      'name':name,
      'phone':phone,
      'email':email
    });


    DioHelper.postData(url: 'edit_profile',data:formData).then((value){

      editProfileModel=EditProfileModel.fromJson(value.data);
      print(value.data);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: (value.data["status"]==1)?Colors.green:Colors.red,
          content: Text(value.data["message"]),
        ),
      );
      emit(EditProfileViewStateSuccess());
    }).catchError((error)

    {

      print('Error this is Edit  Profile ${error.toString()}');

      emit(EditProfileViewStateError());
    }
    );

  }

  XFile? ImageEditProfilePhoto;
  var pickerPhoto = ImagePicker();
  Future getProfileImageByGallery() async {
    emit(EditImagePickerProfileViewLoading());
    final pickedFile = await pickerPhoto.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      ImageEditProfilePhoto = XFile(pickedFile.path );
      emit(EditImagePickerProfileViewSuccess());
    } else {
      print('no image selected');
      emit(EditImagePickerProfileViewError());
    }
  }

  }


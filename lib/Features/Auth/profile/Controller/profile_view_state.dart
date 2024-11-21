import '../Model/edit_profile_model.dart';

abstract class ProfileViewState {}

class InitializeProfileViewState extends ProfileViewState{}

class ProfileViewStateLoading extends ProfileViewState{}
class ProfileViewStateSuccess extends ProfileViewState{}

class ProfileViewStateError extends ProfileViewState{}



class EditProfileViewStateLoading extends ProfileViewState{}
class EditProfileViewStateSuccess extends ProfileViewState{


  EditProfileViewStateSuccess();

}
class EditProfileViewStateError extends ProfileViewState{}



class EditImagePickerProfileViewLoading extends ProfileViewState{}
class EditImagePickerProfileViewSuccess extends ProfileViewState{


}
class EditImagePickerProfileViewError extends ProfileViewState{}
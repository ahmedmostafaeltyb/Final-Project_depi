import 'package:gaith/Features/main/Donatio%20Need/model/success_another_personal_model.dart';

import '../model/success_me_model.dart';

abstract class DonationNeedViewState {}

class InitializeDonationNeedViewState extends DonationNeedViewState {}

class RequestADonationForMeStateLoading extends DonationNeedViewState {}

class RequestADonationForMeStateSuccess extends DonationNeedViewState {

  SuccessMeModel? successMeModel2;
  RequestADonationForMeStateSuccess(this.successMeModel2);
}

class RequestADonationForMeStateError extends DonationNeedViewState {
  final String error;
  RequestADonationForMeStateError(this.error);
}


class PhotoDonationLoadingState extends DonationNeedViewState {}
class PhotoDonationSuccessState extends DonationNeedViewState {}
class PhotoDonationErrorState extends DonationNeedViewState {}







class RequestADonationToAnotherPersonStateLoading extends DonationNeedViewState {}

class RequestADonationToAnotherPersonStateSuccess extends DonationNeedViewState {

  SuccessAnotherModel?successAnotherModel2;
  RequestADonationToAnotherPersonStateSuccess(this.successAnotherModel2);
}

class RequestADonationToAnotherPersonStateError extends DonationNeedViewState {
  final String error;
  RequestADonationToAnotherPersonStateError(this.error);
}
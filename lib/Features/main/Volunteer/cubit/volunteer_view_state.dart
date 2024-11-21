import 'package:flutter/cupertino.dart';

import '../model/volunteer_model.dart';
import '../model/volunteer_success_model.dart';
abstract class VolunteerViewState {}//

class InitializeVolunteerViewState extends VolunteerViewState {}

class VolunteerViewStateLoading extends VolunteerViewState {}

class VolunteerViewStateSuccess extends VolunteerViewState {}

class VolunteerViewStateError extends VolunteerViewState  {
  final String error;
  VolunteerViewStateError(this.error);
}

class AddVolunteerViewStateLoading extends VolunteerViewState {}

class AddVolunteerViewStateSuccess extends VolunteerViewState {
  VolunteerSuccessModel? volunteerSuccessModel;
  AddVolunteerViewStateSuccess(this.volunteerSuccessModel);
}

class AddVolunteerViewStateError extends VolunteerViewState  {
  final String error;
  AddVolunteerViewStateError(this.error);
}


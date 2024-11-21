import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaith/Features/main/Volunteer/cubit/volunteer_view_state.dart';
import '../../../../core/sharde/dioHelper.dart';
import '../model/volunteer_model.dart';
import '../model/volunteer_success_model.dart';


class VolunteerViewCubit extends Cubit<VolunteerViewState> {
  VolunteerViewCubit() : super(InitializeVolunteerViewState());
  VolunteerModel?volunteerModel;
  void getVolunteerData() {
    emit(VolunteerViewStateLoading());


    DioHelper.getData(url: 'get_volunteer')
        .then((value) {
          print('Successs');
          volunteerModel=VolunteerModel.fromJson(value.data);
          print( volunteerModel!.message);
          print(value.data);
      emit(VolunteerViewStateSuccess());
    })
        .catchError((error) {
      print('Error     ${error.toString()}');
      emit(VolunteerViewStateError(error.toString()));
    });
  }
  VolunteerSuccessModel? volunteerSuccessModel;
  void addVolunteer({
    required String name,required  String age,
    required String address,required String work,
    required String ex,required String volunteer_id
    }) {
    emit(AddVolunteerViewStateLoading());
    DioHelper.postData(url: 'add_volunteer',data: {
      'name': name,
      'age': age,
      'address': address,
      'work': work,
      'ex': ex,
      'volunteer_id': volunteer_id

    })
        .then((value) {
      print('Successs');

      volunteerSuccessModel=VolunteerSuccessModel.fromJson(value.data);
      print(value.data);
      emit(AddVolunteerViewStateSuccess(volunteerSuccessModel!));
    })
        .catchError((error) {
      print('Error     ${error.toString()}');
      emit(AddVolunteerViewStateError(error.toString()));
    });
  }

}

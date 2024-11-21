





import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:gaith/Features/drawer/zakat/zakat_cubit/zakat_state.dart';





class ZakatViewCubit extends Cubit<ZakatState>{
  ZakatViewCubit():super(InitializeZakatViewState());

  int selectedIndex = 1;

  void changSelectedIndex({required int index}) {
    selectedIndex = index;
    emit(ChangeItemZakatSuccess());
  }
  num AmountZakat=0;
  void ClcZakatAlMaa({required num Amount}){

    AmountZakat=Amount*(2.5/100);
    emit(AmountZakatSuccess());

  }

num ?AmountGoald;
  void ClcZakatGoald({required num numberOfGram,required num amountGram}){
    if(numberOfGram<85)
      {
        Fluttertoast.showToast(
            msg: 'لم يبلغ حد الزكاه',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    else
      {
        num AmountGold2=numberOfGram*amountGram;
        AmountGoald=AmountGold2*(2.5/100);
      }


    emit(AmountZakatSuccess());

  }


}






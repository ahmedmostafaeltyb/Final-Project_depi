

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaith/Features/main/payment/manager/payment_state.dart';
import 'package:gaith/core/sharde/dioHelper.dart';
import 'package:gaith/core/sharde/widget/navigation.dart';
import 'package:myfatoorah_flutter/MFApplePayButton.dart';
import 'package:myfatoorah_flutter/MFCardView.dart';
import 'package:myfatoorah_flutter/MFModels.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';

import '../widget/payment_error_screen.dart';
import '../widget/payment_scuccess_screen.dart';

const String testAPIKey =
    "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL";

class PaymentViewCubit extends Cubit<PaymentViewState> {
  PaymentViewCubit() : super(InitializePaymentViewState());
  String? _response = '';
  MFInitiateSessionResponse? session;
  List<MFPaymentMethod> paymentMethods = [];
  List<bool> isSelected = [];
  int selectedPaymentMethodIndex = -1;

  String cardNumber = "5453010000095489";
  String expiryMonth = "05";
  String expiryYear = "21";
  String securityCode = "100";
  String cardHolderName = "Test Account";

  String amount = "5.00";
  bool visibilityObs = false;
  late MFCardPaymentView mfCardView;
  late MFApplePayButton mfApplePayButton;
  int selectedIndex = 1;

  int paymentMethode = 1;

  @override
  initiate() async {
    await MFSDK.init(testAPIKey, MFCountry.EGYPT, MFEnvironment.TEST);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initiatePayment();
    });
  }

  void changSelectedIndex({required int index}) {
    selectedIndex = index;
    emit(ChangeItemPaymentSuccess());
  }

  void changPaymentMethode({required int PaymentMethode}) {
    paymentMethode = PaymentMethode;
    emit(ChangeItemPaymentMethodeSuccess());
  }

  log(Object object) {
    var json = const JsonEncoder.withIndent('  ').convert(object);
    debugPrint(json);
    _response = json;
    emit(PaymentViewStateDecoder());
  }

  initiatePayment() async {
    var request = MFInitiatePaymentRequest(
      invoiceAmount: double.parse(amount),
      currencyIso: "EGP",
    );

    await MFSDK
        .initiatePayment(request, MFLanguage.ARABIC)
        .then((value) => {
      log(value),
      paymentMethods.addAll(value.paymentMethods!),
      for (int i = 0; i < paymentMethods.length; i++)
        isSelected.add(false)
    })
        .catchError((error) => {log(error.message)});
  }

  setPaymentMethodSelected(int index, bool value) {
    if (value) {
      selectedPaymentMethodIndex = index;
      isSelected =
      List<bool>.generate(paymentMethods.length, (i) => i == index);
    } else {
      isSelected[index] = value;
      if (selectedPaymentMethodIndex == index) {
        selectedPaymentMethodIndex = -1;
      }
    }
  }

  void initPayment() {
    initiate();
    emit(PaymentViewStateIntial());
  }

  void AddPayment({required dynamic donation_id,dynamic price,context}) {
    emit(PaymentViewStateLoading ());
    DioHelper.getData(url:'do_pay/${donation_id}/${price}').then((value) {
      emit(PaymentViewStateSuccess());
      navigato(context, PaymentScuccessScreen());

    }).catchError((error) {
      navigato(context, PaymentErrorScreen());
      emit(PaymentViewStateError(error.toString()));
    });
  }
}
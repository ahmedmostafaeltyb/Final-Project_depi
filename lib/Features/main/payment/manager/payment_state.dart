abstract class PaymentViewState {}

class InitializePaymentViewState extends PaymentViewState{}
class PaymentViewStateIntial extends PaymentViewState{}
class PaymentViewStateDecoder extends PaymentViewState{}
class PaymentViewStateLoading extends PaymentViewState{}

class PaymentViewStateSuccess extends PaymentViewState{}
class ChangeItemPaymentSuccess extends PaymentViewState{}
class ChangeItemPaymentMethodeSuccess extends PaymentViewState{}

class PaymentViewStateError extends PaymentViewState{

  final String error;
  PaymentViewStateError(this.error);
}
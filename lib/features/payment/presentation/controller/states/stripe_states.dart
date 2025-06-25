abstract class StripeState {}

class StripeInitial extends StripeState {}

class StripeLoading extends StripeState {}

class StripeSuccess extends StripeState {}

class StripeFailure extends StripeState {
  final String error;
  StripeFailure({required this.error});
}

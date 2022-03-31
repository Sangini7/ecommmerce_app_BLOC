part of 'checkout_bloc.dart';

@immutable
abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();
  @override
  List<Object?> get props => [];
}

class UpdateCheckout extends CheckoutEvent {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final Cart? cart;
  UpdateCheckout(
      {this.fullName,
      this.email,
      this.address,
      this.zipCode,
      this.country,
      this.city,
      this.cart});
  @override
  List<Object?> get props =>
      [fullName, email, address, country, city, zipCode, cart];
}

class ConfirmCheckout extends CheckoutEvent {
  final Checkout checkout;
  const ConfirmCheckout({required this.checkout});
  @override
  List<Object?> get props => [checkout];
}

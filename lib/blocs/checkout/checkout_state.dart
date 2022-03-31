part of 'checkout_bloc.dart';

@immutable
abstract class CheckoutState extends Equatable {
  const CheckoutState();
  @override
  List<Object?> get props => [];
}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  final String? fullName;
  final Checkout checkout;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  CheckoutLoaded(
      {this.fullName,
      this.email,
      this.address,
      this.country,
      this.city,
      this.zipCode,
      this.products,
      this.subtotal,
      this.deliveryFee,
      this.total})
      : checkout = Checkout(
            fullName: fullName,
            email: email,
            address: address,
            country: country,
            city: city,
            zipCode: zipCode,
            products: products,
            subtotal: subtotal,
            deliveryFee: deliveryFee,
            total: total);
  @override
  List<Object?> get props => [
        fullName,
        email,
        address,
        country,
        city,
        zipCode,
        products,
        subtotal,
        total,
        deliveryFee
      ];
}

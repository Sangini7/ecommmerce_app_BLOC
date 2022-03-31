import 'package:equatable/equatable.dart';

import 'models.dart';

class Checkout extends Equatable {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;

  const Checkout(
      {required this.fullName,
      required this.email,
      required this.address,
      required this.country,
      required this.city,
      required this.zipCode,
      required this.products,
      required this.subtotal,
      required this.deliveryFee,
      required this.total});

  @override
  // TODO: implement props
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
  Map<String, Object> toDocument() {
    Map customerAddress = {};
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['country'] = country;
    customerAddress['zipCode'] = zipCode;
    return {
      'customerAddress': customerAddress,
      'customerEmail': email!,
      'customerName': fullName!,
      'products': products!.map((product) => product.name).toList(),
      'deliveryFee': deliveryFee!,
      'subtotal': subtotal!,
      'total': total!
    };
  }
}

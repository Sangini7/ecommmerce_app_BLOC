import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommmerce_app/models/models.dart';
import 'package:ecommmerce_app/repositories/categories/base_category_repository.dart';
import 'package:ecommmerce_app/repositories/checkout/base_checkout_repository.dart';
import 'package:flutter/material.dart';

class CheckOutRepository extends BaseCheckoutRepository {
  final FirebaseFirestore _firebaseFirestore;
  CheckOutRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> addCheckout(Checkout checkout) {
    print("xyy");
    return _firebaseFirestore.collection('checkout').add(checkout.toDocument()
        //{
        // 'customerAddress': {
        //   'address': checkout.address,
        //   'city': checkout.city,
        //   'country': checkout.country,
        //   'zipCode': checkout.zipCode
        // },
        // 'customerEmail': checkout.email!,
        // 'customerName': checkout.fullName!,
        // 'deliveryFee': checkout.deliveryFee!,
        // 'products': checkout.products!.map((product) => product.name).toList(),
        // 'subtotal': checkout.subtotal!,
        // 'total': checkout.total!
        // }
        );
  }
}

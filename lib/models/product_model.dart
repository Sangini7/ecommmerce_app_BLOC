import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageURL;
  final double price;
  final bool isRecommended;
  final bool isPopular;
  const Product(
      {required this.isRecommended,
      required this.name,
      required this.category,
      required this.imageURL,
      required this.price,
      required this.isPopular});
  static Product fromSnapShot(DocumentSnapshot snap) {
    Product product = Product(
        name: snap['name'],
        category: snap['category'],
        imageURL: snap['imageUrl'],
        isPopular: snap['isPopular'],
        isRecommended: snap['isRecommended'],
        price: snap['price']);
    return product;
  }

  static List<Product> products = [
    Product(
        isRecommended: true,
        name: 'Soft Drink #1',
        category: 'Soft Drink',
        imageURL:
            'https://images.unsplash.com/photo-1625126590447-cb769384e1f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
        price: 2.99,
        isPopular: false),
    Product(
        isRecommended: false,
        name: 'Soft Drink #2',
        category: 'Soft Drink',
        imageURL:
            'https://images.unsplash.com/photo-1556881286-fc6915169721?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        price: 2.99,
        isPopular: true),
    Product(
        isRecommended: true,
        name: 'Soft Drink #3',
        category: 'Soft Drink',
        imageURL:
            'https://images.unsplash.com/photo-1625126590447-cb769384e1f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
        price: 2.99,
        isPopular: true),
    Product(
        isRecommended: true,
        name: 'Smoothies #1',
        category: 'Smoothies',
        imageURL:
            'https://images.unsplash.com/photo-1553607558-455f4310f6ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=990&q=80',
        price: 2.99,
        isPopular: false),
    Product(
        isRecommended: false,
        name: 'Smoothie #2',
        category: 'Smoothies',
        imageURL:
            'https://images.unsplash.com/photo-1553607558-455f4310f6ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=990&q=80',
        price: 2.99,
        isPopular: false),
  ];

  @override
  // TODO: implement props
  List<Object?> get props =>
      [name, category, imageURL, price, isRecommended, price];
}

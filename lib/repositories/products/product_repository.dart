import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommmerce_app/models/models.dart';
import 'package:ecommmerce_app/repositories/products/base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;
  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProducts() {
    // TODO: implement geAllProducts
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapShot(doc)).toList();
    });
  }
}

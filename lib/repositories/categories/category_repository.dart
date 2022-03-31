import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommmerce_app/models/category_model.dart';
import 'package:ecommmerce_app/repositories/categories/base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;
  CategoryRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Stream<List<Category>> getAllCategories() {
    // TODO: implement getAllCategories
    return _firebaseFirestore
        .collection('categories')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Category.fromSnapShot(doc)).toList();
    });
  }
}

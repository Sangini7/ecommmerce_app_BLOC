import 'package:ecommmerce_app/models/category_model.dart';
import 'package:ecommmerce_app/models/models.dart';
import 'package:ecommmerce_app/widget/widgets.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  static Route route({required Category category}) {
    return MaterialPageRoute(
        builder: (_) => CatalogScreen(category: category),
        settings: RouteSettings(name: routeName));
  }

  final Category category;

  const CatalogScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: CustomNavBar(
        screen: routeName,
      ),
      body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.15),
          itemCount: categoryProducts.length,
          itemBuilder: (context, index) {
            return Center(
              child: ProductCard(
                widthFactor: 2.2,
                product: categoryProducts[index],
              ),
            );
          }),
    );
  }
}

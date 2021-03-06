import 'package:ecommmerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommmerce_app/models/models.dart';
import 'package:ecommmerce_app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => WishlistScreen(),
        settings: RouteSettings(name: routeName));
  }

  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Wishlist'),
      bottomNavigationBar: CustomNavBar(
        screen: routeName,
      ),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WishlistLoaded) {
            return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 2.2),
                itemCount: state.wishlist.products.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: ProductCard(
                      widthFactor: 1.1,
                      leftPosition: 100,
                      product: state.wishlist
                          .products[index], //loaded state has a wishlist
                      isWishlist: true,
                    ),
                  );
                });
          } else {
            return Text('Something went wrong');
          }
        },
      ),
    );
  }
}

import 'package:ecommmerce_app/blocs/cart/cart_bloc.dart';
import 'package:ecommmerce_app/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;

  const CartProductCard(
      {Key? key, required this.product, required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageURL,
            fit: BoxFit.cover,
            width: 100,
            height: 80,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  '\$${product.price}',
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
          ),
          SizedBox(width: 30),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoading)
                return CircularProgressIndicator();
              else if (state is CartLoaded)
                return Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          context
                              .read<CartBloc>()
                              .add(CartProductRemoved(product));
                        },
                        icon: Icon(Icons.remove_circle)),
                    Text(
                      '$quantity',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    IconButton(
                        onPressed: () {
                          context
                              .read<CartBloc>()
                              .add(CartProductAdded(product));
                        },
                        icon: Icon(Icons.add_circle))
                  ],
                );
              else
                return (Text('Something Went Wrong'));
            },
          )
        ],
      ),
    );
  }
}

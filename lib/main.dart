import 'package:ecommmerce_app/blocs/cart/cart_bloc.dart';
import 'package:ecommmerce_app/blocs/category/category_bloc.dart';
import 'package:ecommmerce_app/blocs/checkout/checkout_bloc.dart';
import 'package:ecommmerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommmerce_app/config/app_router.dart';
import 'package:ecommmerce_app/config/theme.dart';
import 'package:ecommmerce_app/repositories/checkout/checkout_repository.dart';
import 'package:ecommmerce_app/repositories/products/product_repository.dart';
import 'package:ecommmerce_app/screens/checkout/checkout_screen.dart';
import 'package:ecommmerce_app/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommmerce_app/repositories/categories/category_repository.dart';

import 'blocs/product/product_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
            create: (_) => CategoryBloc(
                  categoryRepository: CategoryRepository(),
                )..add(LoadCategories())),
        BlocProvider(
            create: (_) => ProductBloc(
                  productRepository: ProductRepository(),
                )..add(LoadProducts())),
        BlocProvider(
            create: (context) => CheckoutBloc(
                  checkOutRepository: CheckOutRepository(),
                  cartBloc: context.read<CartBloc>(),
                ))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommmerce_app/blocs/category/category_bloc.dart';
import 'package:ecommmerce_app/blocs/product/product_bloc.dart';
import 'package:ecommmerce_app/models/category_model.dart';
import 'package:ecommmerce_app/models/models.dart';
import 'package:ecommmerce_app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => HomeScreen(), settings: RouteSettings(name: routeName));
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Shopper'),
      bottomNavigationBar: CustomNavBar(
        screen: routeName,
      ),
      body: Column(
        children: [
          Container(child: BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is CategoryLoaded) {
                return CarouselSlider(
                  options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      enlargeStrategy: CenterPageEnlargeStrategy.height),
                  items: state.categories
                      .map((category) => HeroCarouselCard(category: category))
                      .toList(),
                );
              } else {
                return Container(child: Text('Something went wrong'));
              }
            },
          )),
          SectionTitle(title: 'RECOMMENDED'),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is ProductLoaded) {
                return ProductCarousel(
                    products: state.products
                        .where((product) => product.isRecommended)
                        .toList());
              } else
                return Container(
                  child: Text('Something went wrong'),
                );
            },
          ),
          SectionTitle(title: 'POPULAR'),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                print("xyu");
                return Center(child: CircularProgressIndicator());
              }
              if (state is ProductLoaded) {
                return ProductCarousel(
                    products: state.products
                        .where((product) => product.isPopular)
                        .toList());
              } else
                return Container(
                  child: Text('Something went wrong'),
                );
            },
          ),

          //product card
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:ecommmerce_app/models/category_model.dart';
import 'package:ecommmerce_app/models/models.dart';
import 'package:ecommmerce_app/widget/widgets.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => SplashScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, '/'));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage('assets/images/images.png'),
              fit: BoxFit.cover,
              width: 125,
              height: 125,
            ),
          ),
          SizedBox(height: 30),
          Container(
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: Colors.black,
              child: Text(
                'Shopinfy',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Colors.white),
              ))
        ],
      ),
    );
  }
}

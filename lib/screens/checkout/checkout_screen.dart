import 'dart:async';
import 'package:ecommmerce_app/blocs/checkout/checkout_bloc.dart';
import 'package:ecommmerce_app/widget/custom_appbar.dart';
import 'package:ecommmerce_app/widget/custom_navbar.dart';
import 'package:ecommmerce_app/widget/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => CheckoutScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Checkout',
        ),
        bottomNavigationBar: CustomNavBar(
          screen: routeName,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CheckoutLoaded)
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CUSTOMER INFORMATION',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    _buildTextFormField((value) {
                      context.read<CheckoutBloc>().add(
                            UpdateCheckout(email: value),
                          );
                    }, context, 'Email'),
                    _buildTextFormField((value) {
                      context.read<CheckoutBloc>().add(
                            UpdateCheckout(fullName: value),
                          );
                    }, context, 'Name'),
                    Text(
                      'DELIVERY INFORMATION',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    _buildTextFormField((value) {
                      context.read<CheckoutBloc>().add(
                            UpdateCheckout(address: value),
                          );
                    }, context, 'Address'),
                    _buildTextFormField((value) {
                      context.read<CheckoutBloc>().add(
                            UpdateCheckout(city: value),
                          );
                    }, context, 'City'),
                    _buildTextFormField((value) {
                      context.read<CheckoutBloc>().add(
                            UpdateCheckout(country: value),
                          );
                    }, context, 'Country'),
                    _buildTextFormField((value) {
                      context.read<CheckoutBloc>().add(
                            UpdateCheckout(zipCode: value),
                          );
                    }, context, 'Zip'),
                    Text(
                      'ORDER SUMMARY',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    OrderSummary(),
                  ],
                );
              return (Text('Something went wrong!'));
            },
          ),
        ));
  }

  Padding _buildTextFormField(
    Function(String)? onChanged,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          SizedBox(
            width: 75,
            child:
                Text(labelText, style: Theme.of(context).textTheme.bodyText1),
          ),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.only(left: 10),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
          )
        ]));
  }
}

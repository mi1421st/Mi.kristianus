import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kulina/bloc/cart/cart_bloc.dart';

import 'cart_body.dart';
import 'model/cart_view_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  CartPageState createState() => CartPageState();
  static const routeName = '/cart';

  static Route route() {
    return MaterialPageRoute <void>(builder: (_) => const CartPage());
  }

}

class CartPageState extends State<CartPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text("review Pesanan"),
              Text("Daftar Pesanan"),
              Text("Senin, 10 feb 2020"),
              Text("Senin, 10 feb 2020"),
              CartBody()
            ],
          ),
        )
    );
  }

}
import 'package:flutter/material.dart';
import 'package:kulina/cart/model/cart_view_model.dart';
import 'package:provider/provider.dart';
import 'package:kulina/cart/cart_page.dart';
import 'package:kulina/model/products.dart';

class AddToCartButton extends StatelessWidget {
  AddToCartButton(this.product);
  final Products product;
  @override
  Widget build(BuildContext context) {

    var cart = Provider.of<CartViewModel>(context);
    double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
        onPressed: () {
          // print("tambah ke keranjang");
          // Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
          cart.addItemToCart(product);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            side: MaterialStateProperty.all(
                const BorderSide(
                    color: Colors.deepOrangeAccent,
                    width: 2
                )
            )
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          width: width,
          child: const Text(
            "Tambah ke keranjang",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.deepOrangeAccent
            ),
          ),
        )
    );
  }

}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kulina/bloc/cart/cart_bloc.dart';

import 'model/cart_view_model.dart';

class CartBody extends StatefulWidget {
  const CartBody({Key? key}) : super(key: key);

  @override
  CartBodyState createState() => CartBodyState();
}

class CartBodyState extends State<CartBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<CartViewModel>(context);

    var items = cart.items;
    print(items);
    print(items[0]!.cartItem);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          print(items);

          return Column(
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  height: height * 0.2,
                  width: width,
                  // color: index%2 == 0 ? Colors.deepOrange : Colors.orangeAccent,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        height: height * 0.15,
                        width: height * 0.18,
                        color: Colors.lightBlueAccent,
                        // child: Image.network(
                        //   items[index]!.cartItem!.imageUrl,
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                width: width * 0.42,
                                height: 55,
                                color: Colors.greenAccent,
                                child: const Text(
                                  "Ayam Kulit Kartel saus keju",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                color: Colors.cyanAccent,
                                child: IconButton(
                                    onPressed: () {
                                      print("delete pressed");
                                    },
                                    icon: Icon(Icons.delete)),
                              )
                            ],
                          ),
                          const Text("Ayam Kulit Kartel saus keju",),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Rp. 29,000",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18
                                ),),
                              SizedBox(
                                width: width * 0.07,
                              ),
                              Row(
                                children: [
                                  Container(
                                    color: Colors.yellowAccent,
                                    width: 30,
                                    height: 40,
                                    child: IconButton(
                                      onPressed: () {
                                        cart.removeOneItemFromChart(items[index]!.cartItem!.id.toString());
                                      },
                                      icon: const Center(
                                        child: Icon(
                                            Icons.remove
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.yellowAccent,
                                    width: 45,
                                    height: 40,
                                    child: Center(child: Text("3")),
                                  ),
                                  Container(
                                    color: Colors.yellowAccent,
                                    width: 30,
                                    height: 40,
                                    child: IconButton(
                                      onPressed: (){},
                                      icon: Center(child: Icon(Icons.add)),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )
              ),
              const Divider(),
            ],
          );
        });
  }

}
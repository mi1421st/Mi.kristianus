import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kulina/bloc/cart/cart_bloc.dart';
import 'package:kulina/bloc/home_app_bar/home_app_bar_bloc.dart';
import 'package:kulina/bloc/home/home_bloc.dart';
import 'package:kulina/cart/model/cart_view_model.dart';

import 'package:provider/provider.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:kulina/home/home_add_to_cart_button.dart';
import 'package:kulina/home/home_header.dart';

part 'package:kulina/home/home_app_bar.dart';


class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();

  static const routeName = '/home';

  static Route route() {
    return MaterialPageRoute <void>(builder: (_) => const HomePage());
  }
}

class HomePageState extends State<HomePage> {

  final formatNumber = NumberFormat('#,000');

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return MultiBlocProvider(
      providers:[
          BlocProvider(
              create: (context) {
            return HomeBloc()..add(LoadData());
          },
        ),
        BlocProvider(
          create: (context) {
            return HomeAppBarBloc()..add(LoadDate());
          },
        ),
        BlocProvider(
          create: (context) {
            return CartBloc();
          },
        )
      ],
        child: SafeArea(
          child: Scaffold(
            // appBar: HomeAppBar(),
            body: NestedScrollView(
              headerSliverBuilder: (context, bool isScrolled) {
                return [
                  HomeAppBar(),
                ];
              },
              body: Container(
                // color: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const HomeHeaderDate(),
                      const SizedBox(height: 10,),
                      BlocConsumer<HomeBloc, HomeState>(
                        listener: (context, state) {  },
                        builder: (context, state) {
                          if(state is HomeLoaded) {
                            return GridView.builder(
                                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 1 / 1.85,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                                itemCount: state.products.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Container(
                                    alignment: Alignment.center,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(
                                      // color: Colors.amber,
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: height * 0.18,
                                              width: width,
                                              child: Image.network(
                                                state.products[index].imageUrl,
                                                fit: BoxFit.cover,
                                              ),
                                              // color: Colors.redAccent,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 5),
                                              // color: Colors.cyanAccent,
                                              child: Text(
                                                // "Nasi kebuli ayam",
                                                state.products[index].name,
                                                style: const TextStyle(
                                                    fontWeight:FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Colors.black87
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 5),
                                              // color: Colors.cyan,
                                              child: Text(
                                                // "by dapur anggrek",
                                                state.products[index].brandName,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                    color: Colors.grey[700]
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 5),
                                              // color: Colors.cyanAccent,
                                              child: Text(
                                                // "Nasi kebuli ayam",
                                                state.products[index].packageName,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13,
                                                    color: Colors.grey[600]
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                                              child: RichText(
                                                text: TextSpan(
                                                  // text: "Rp 35,000",
                                                    text: "Rp. ${formatNumber.format(state.products[index].price)}",
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 15,
                                                        color: Colors.black87
                                                    ),
                                                    children: const [
                                                      TextSpan(
                                                          text: " termasuk ongkir",
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 12,
                                                              color: Colors.blueGrey
                                                          )
                                                      )
                                                    ]
                                                ),
                                              ),
                                            ),
                                            AddToCartButton(state.products[index])
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }
                            );
                          }
                          else {
                            // return const Text("Home Loading");
                            return const Center(child: CircularProgressIndicator(),);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ),
        ),
    );
  }


}
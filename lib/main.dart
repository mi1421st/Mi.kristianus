import 'package:flutter/material.dart';
import 'package:kulina/home/home_page.dart';
import 'package:provider/provider.dart';
import 'cart/cart_page.dart';
import 'cart/model/cart_view_model.dart';
import 'service/repo_config.dart';
import 'model/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) :super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Products>> futureProducts;
  RepoConfig repoConfig = RepoConfig();

  @override
  void initState() {
    futureProducts = repoConfig.fetchData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    RepoConfig().fetchData().then((value) => print("value: $value"));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CartViewModel()),
      ],
      child: MaterialApp(
        title: "This is Title",
        home: Scaffold(
          body: FutureBuilder<List<Products>>(
            future: futureProducts,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return const HomePage();
              }
              else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              // return const Text("Loading. . .");
              return const CircularProgressIndicator();
            },
          ),
        ),
        routes: {
          CartPage.routeName: (context) => const CartPage(),
          HomePage.routeName: (context) => const HomePage(),
        },
      ),
    );
  }

}

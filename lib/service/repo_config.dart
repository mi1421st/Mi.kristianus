import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kulina/model/products.dart';

class RepoConfig {
  final String baseUrl = "https://kulina-recruitment.herokuapp.com";

  Future<List<Products>> fetchData() async{
    final response = await http.get(Uri.parse("$baseUrl/products"));

    if(response.statusCode == 200) {
      return Products().productsFromJson(response.body);
    }
    else {
      print(response.statusCode);
      throw Exception("Failed to load Products data");
    }
  }
}
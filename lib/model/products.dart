import 'dart:convert';

class Products {
  final int id;
  final String name;
  final String imageUrl;
  final String brandName;
  final String packageName;
  final int price;
  final double rating;

  Products({
    this.id = -1,
    this.name = "",
    this.imageUrl = "",
    this.brandName = "",
    this.packageName = "",
    this.price = 0,
    this.rating = 0
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        id: json["id"],
        name: json['name'],
        imageUrl: json["image_url"],
        brandName: json["brand_name"],
        packageName: json["package_name"],
        price: json["price"],
        rating: json["rating"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image_url": imageUrl,
      "brand_name": brandName,
      "package_name": packageName,
      "price": price,
      "rating": rating
    };
  }

  @override
  String toString() {
    return "Products{id: $id, name: $name, image_url: $imageUrl,"
        " brand_name: $brandName, package_name: $packageName,"
        " price: $price, rating: $rating}";
  }

  List<Products> productsFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return List<Products>.from(data.map((item) => Products.fromJson(item)));
  }
}
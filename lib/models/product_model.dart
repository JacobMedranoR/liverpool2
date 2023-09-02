import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  String image;
  String name;
  double price;

  Product({required this.image, required this.name, required this.price});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        image: json["image"],
        name: json["name"],
        price: json["price"]?.toDouble(),
      );

  Map<String, dynamic> toJson() =>
      {"image": image, "name": name, "price": price};
}

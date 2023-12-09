// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  final String brand;
  final String desc;
  final String image;
  final String long;
  final String name;
  final String price;

  Products({
    required this.brand,
    required this.desc,
    required this.image,
    required this.long,
    required this.name,
    required this.price,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        brand: json["brand"],
        desc: json["desc"],
        image: json["image"],
        long: json["long"],
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "brand": brand,
        "desc": desc,
        "image": image,
        "long": long,
        "name": name,
        "price": price,
      };
}

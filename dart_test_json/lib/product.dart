import 'dart:io';

class Product {
  final int id;
  final String name;
  final double price;
  final String description;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      description: json['description'],
    );
  }
  void readFileAsync() {
    new File('./assets/user.json').readAsString().then((c) => print(c));
  }
}

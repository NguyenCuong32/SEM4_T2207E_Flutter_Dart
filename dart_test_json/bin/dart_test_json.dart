import 'dart:convert';
import 'dart:io';
import 'package:dart_test_json/product.dart';

void main(List<String> arguments) async {
  // String jsonString = await File(
  //         'E:/1.Manager/102.Privates/3.Edu/SEM4/Example/sem4_flutter_dart/01.basic_dart/dart_test_json/bin/products.json')
  //     .readAsStringSync();
  String jsonString = await File('./bin/products.json').readAsStringSync();
  // print(jsonString);
  List<Product> products = getListProduct(jsonString);
  for (var product in products) {
    print(product.id);
    print(product.name);
    print(product.price);
    print(product.description);
  }
}

List<Product> getListProduct(String jsonContent) {
  List<dynamic> jsonList = jsonDecode(jsonContent);
  List<Product> products = [];
  for (var jsonProduct in jsonList) {
    products.add(Product.fromJson(jsonProduct));
  }
  return products;
}

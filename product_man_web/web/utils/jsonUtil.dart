import 'dart:convert';
import 'dart:io';

import '../models/product.dart';

class JsonUtil {
  static String getString() {
    String contents = File('assets/product.json').readAsStringSync();
    return contents;
  }

  static List<Product> getProduct(String json) {
    List<dynamic> jsonList = jsonDecode(json);
    List<Product> products = [];

    for (var jsonProduct in jsonList) {
      products.add(Product.fromJson(jsonProduct));
    }
    return products;
  }
}

import 'dart:convert';

import 'package:web/helpers.dart';

import 'models/product.dart';
import 'utils/jsonUtil.dart';

// import 'utils/jsonUtil.dart';
HTMLLIElement newLI(String itemText) =>
    (document.createElement('li') as HTMLLIElement)..text = itemText;
List<Product>? products;
void main() {
  String jsonUtil = JsonUtil.getString();
  final alert = querySelector('#alert') as HTMLDivElement;
  alert.text = jsonUtil;
  String json = getString();
  List<Product> products = getProduct(json);
  renderProduct(products);
  final add = querySelector('#addNew');
  add?.onClick.listen((event) {
    //Add
    products.add(Product(
      id: products.length + 1,
      name: 'Iphone',
      price: 1200.0,
      description: 'New version iphone 16',
    ));
    renderProduct(products);
  });
}

String getString() {
  String contents =
      '[{"id": 1,"name": "Áo Polo nam","price": 250000,"description": "Áo Polo nam hàng hiệu, chất liệu cotton cao cấp."},{"id": 2,"name": "Áo Polo nam","price": 250000,"description": "Áo Polo nam hàng hiệu, chất liệu cotton cao cấp."}]';
  return contents;
}

List<Product> getProduct(String json) {
  List<dynamic> jsonList = jsonDecode(json);
  List<Product> products = [];

  for (var jsonProduct in jsonList) {
    products.add(Product.fromJson(jsonProduct));
  }
  return products;
}

void renderProduct(List<Product> products) {
  final output = querySelector('#output') as HTMLDivElement;
  output.text = '';
  for (final item in products) {
    output?.appendChild(newLI(item.id.toString()));
    output?.appendChild(newLI(item.name.toString()));
    output?.appendChild(newLI(item.description.toString()));
  }
}

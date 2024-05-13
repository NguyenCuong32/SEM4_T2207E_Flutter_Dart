import 'dart:convert';

import 'package:bee_shop/models/category.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<StatefulWidget> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<ShopCategory> _categories = List.empty();
  @override
  void initState() {
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
    );
  }

  void getCategories() async {
    try {
      const String url =
          'https://faimockapi.azure-api.net/api/v1/category/getshopcategory';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print(response.body);
        _categories = getShopCategories(response.body);
        for (var c in _categories) {
          print(c.title);
        }
      } else {
        print('False');
      }
    } catch (e) {}
  }

  List<ShopCategory> getShopCategories(String json) {
    List<dynamic> jsonList = jsonDecode(json);
    List<ShopCategory> categories = [];
    try {
      for (var c in jsonList) {
        var category = ShopCategory.fromJson(c);
        categories.add(category);
      }
    } catch (e) {
      print(e);
    }
    return categories;
  }
}

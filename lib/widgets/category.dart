import 'dart:convert';

import 'package:bee_shop/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    print('Init State');
    super.initState();
    getCategories();
  }

  void onAddCategoryPress(BuildContext context) {}
  @override
  Widget build(BuildContext context) {
    print('Building ...');
    print('Count ${_categories.length}');
    Widget body = const Center(child: Text('There no categories item'));
    if (_categories.isNotEmpty) {
      body = ListView.builder(
        itemCount: _categories.length,
        itemBuilder: ((context, index) => Dismissible(
              key: ValueKey(_categories[index].categoryId),
              child: ListTile(
                leading: SizedBox(
                  width: 32,
                  height: 32,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(_categories[index].image),
                  ),
                ),
                title: Text(_categories[index].title),
                trailing: Text(_categories[index].quantity.toString()),
              ),
            )),
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
          actions: [
            IconButton(
                onPressed: () => onAddCategoryPress(context),
                icon: const Icon(Icons.add))
          ],
        ),
        body: body);
  }

  void getCategories() async {
    try {
      const String url =
          'https://faimockapi.azure-api.net/api/v1/category/getshopcategory';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print(response.body);
        setState(() {
          _categories = getShopCategories(response.body);
        });
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

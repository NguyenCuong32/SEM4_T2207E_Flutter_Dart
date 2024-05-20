import 'dart:convert';

import 'package:bee_shop/models/category.dart';
import 'package:bee_shop/widgets/new_category.dart';
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

  void onAddCategoryPress(BuildContext context) async {
    var newItem = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => NewCategory()));
    if (newItem == null) {
      return;
    }
  }

  Future<void> showConfirm(int index) async {
    var ctg = _categories[index];
    var categoryTitle = ctg.title;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure delete ${categoryTitle}'),
            actions: [
              TextButton(onPressed: () {}, child: const Text('OK')),
              TextButton(onPressed: () {}, child: const Text('Cancel'))
            ],
          );
        });
  }

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
              onDismissed: (direction) {
                print('Seleted index ${index}');
                showConfirm(index);
              },
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
          'https://faimockapi.azure-api.net/api/v1/category/getshopcategory3333';
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

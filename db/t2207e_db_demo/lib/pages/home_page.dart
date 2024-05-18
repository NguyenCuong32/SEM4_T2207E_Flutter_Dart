import 'package:flutter/material.dart';
import 'package:t2207e_db_demo/pages/new_category.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  void addCategoryPress() {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => NewCategory()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories list'),
        actions: [
          IconButton(onPressed: addCategoryPress, icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}

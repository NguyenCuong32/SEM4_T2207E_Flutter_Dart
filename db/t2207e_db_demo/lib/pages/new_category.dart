import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:t2207e_db_demo/pages/home_page.dart';

class NewCategory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewCategoryState();
}

class NewCategoryState extends State<NewCategory> {
  var ref = FirebaseDatabase.instance.ref();
  // var _firebase = FirebaseService('categories');
  final _globalKey = GlobalKey<FormState>();
  String _category_title = '';
  int _quantity = 0;
  void _saveCategory() {
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();
      Map<String, dynamic> category = {
        'categoryId': 1,
        'title': _category_title,
        'quantity': _quantity
      };
      ref.child('categories').push().set(category);
      // _firebase.ref.child('categories').push().set(category);
      Navigator.of(context).pop(HomePage());
    }
  }

  void _resest() {
    _globalKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
            key: _globalKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(
                    hintText: 'Please input name category',
                    label: Text('Category name'),
                    icon: Icon(Icons.category_sharp),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.trim().length < 1 ||
                        value.trim().length > 50) {
                      return 'Invalid value';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _category_title = value!;
                    print('Onsave ${_category_title}');
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Please input quantity',
                      label: Text('Quantity'),
                      icon: Icon(Icons.production_quantity_limits_sharp)),
                  initialValue: "1",
                  validator: (value) {
                    if (int.parse(value!) < 1) {
                      return 'Quantity must be greater than 1';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _quantity = int.parse(value!);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () {
                          _saveCategory();
                        },
                        child: const Text('Add Item')),
                    const SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _resest();
                        },
                        child: const Text('Reset'))
                  ],
                )
              ],
            )),
      ),
    );
  }
}

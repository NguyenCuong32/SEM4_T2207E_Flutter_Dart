import 'package:bee_shop/widgets/category.dart';
import 'package:flutter/material.dart';

class NewCategory extends StatefulWidget {
  const NewCategory({super.key});

  @override
  State<StatefulWidget> createState() => NewCategoryState();
}

class NewCategoryState extends State<NewCategory> {
  final _globalKey = GlobalKey<FormState>();
  void _saveCategory() {
    if (_globalKey.currentState!.validate()) {
      Navigator.of(context).pop(const CategoryList());
    }
  }

  void _resest() {
    _globalKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    String _category_name;
    int _quantity = 0;
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
                    _category_name = value!;
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
                      return 'Quantity must be than 1';
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

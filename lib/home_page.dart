import 'package:flutter/material.dart';
import 'package:mealsapp/main_drawer.dart';
import 'category_item.dart';
import 'dummy_data.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Meals App"),
        ),
        body: Container(
          margin: const EdgeInsets.all(15),
          child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            children: DUMMY_CATEGORIES.map((index) {
              return CategoryItem(index.title, index.color, index.id);
            }).toList(),
          ),
        ),
        drawer: MainDrawer());
  }
}

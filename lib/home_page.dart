import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mealsapp/main_drawer.dart';
import 'grid_view_categories.dart';
import 'dummy_data.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black, size: 25),
          backgroundColor: Colors.transparent,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          title: Text(
            "Meals App",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          elevation: 0,
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
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

import 'package:flutter/material.dart';

class CategoryRecipesScreen extends StatelessWidget {
  final String title;
  CategoryRecipesScreen(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Text("The recipes for this category ! "),
      ),
    );
  }
}

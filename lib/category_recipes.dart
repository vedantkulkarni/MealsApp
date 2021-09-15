import 'package:flutter/material.dart';

class CategoryRecipesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> routeArgs = ModalRoute.of(context)!
        .settings
        .arguments as Map<String, String>; //ModalRoute
    final String title = routeArgs["title"].toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: false,
      ),
      body: Center(
        child: Text("The recipes for this category ! "),
      ),
    );
  }
}

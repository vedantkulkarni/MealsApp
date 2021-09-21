import 'package:flutter/material.dart';
import 'package:mealsapp/category_recipes.dart';
import 'package:mealsapp/item_details_screen.dart';
import './home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          // canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: const TextTheme(
              headline1: TextStyle(fontSize: 25, color: Colors.black))),
      home: MyHomePage(),
      routes: {
        "/recipes_screen": (ctx) => CategoryRecipesScreen(),
        "/item_details_screen": (ctx) => ItemDetailsScreen()
      },
    );
  }
}

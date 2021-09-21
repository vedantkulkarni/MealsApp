import 'package:flutter/material.dart';
import 'package:mealsapp/meal_item.dart';
import 'dummy_data.dart';

class CategoryRecipesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> routeArgs = ModalRoute.of(context)!
        .settings
        .arguments as Map<String, String>; //ModalRoute
    final String title = routeArgs["title"].toString();
    final String id = routeArgs["id"].toString();
    final List recipesList = DUMMY_MEALS.where((element) {
      return element.categories.contains(id);
    }).toList();
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(title),
        //   centerTitle: false,
        // ),
        body: ListView.builder(
      itemBuilder: (ctx, index) {
        return Container(
          child: MealItem(
              recipesList[index].imageUrl,
              recipesList[index].duration.toString(),
              recipesList[index].complexity,
              recipesList[index].title,
              recipesList[index].id),
        );
      },
      itemCount: recipesList.length,
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:mealsapp/meal_item.dart';
import 'package:mealsapp/providers/favourites_provider.dart';
import 'dummy_data.dart';
import 'package:provider/provider.dart';

class CategoryRecipesScreen extends StatelessWidget {
  final Function setFavourites;

  CategoryRecipesScreen(this.setFavourites);
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
    FavouritesProvider value = Provider.of<FavouritesProvider>(context);
    return Scaffold(
        body: ListView.builder(
      itemBuilder: (ctx, index) {
        return Container(
          child: MealItem(
              recipesList[index].imageUrl,
              recipesList[index].duration.toString(),
              recipesList[index].complexity,
              recipesList[index].title,
              recipesList[index].id,
              setFavourites,value),
        );
      },
      itemCount: recipesList.length,
    ));
  }
}

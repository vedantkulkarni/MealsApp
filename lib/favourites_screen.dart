import 'package:flutter/material.dart';
import 'package:mealsapp/dummy_data.dart';
import 'package:mealsapp/models/category.dart';

class FavouritesScreen extends StatefulWidget {
  // final String id;
  final List favourites;
  FavouritesScreen(this.favourites);
  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  List<Category>? favouriteMeals;
  void getTheFavouriteMeals() {
    for (int i = 0; i < widget.favourites.length; i++) {
      if (widget.favourites == null) break;
      favouriteMeals!.add(DUMMY_CATEGORIES
          .firstWhere((element) => element.id == widget.favourites[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return favouriteMeals != null
        ? ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: 20, bottom: 5, top: 5, right: 20),
                child: ListTile(
                    leading: Text("${index + 1} ."),
                    title: Text(favouriteMeals![index].title.toString())),
              );
            },
            itemCount: widget.favourites.length,
          )
        : Center(
            child: Text(
              "You don't have any favourites",
              style: TextStyle(fontSize: 20),
            ),
          );
  }
}

import 'package:flutter/material.dart';
import 'package:mealsapp/dummy_data.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/providers/favourites_provider.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FavouritesProvider favmealsList = Provider.of<FavouritesProvider>(context);
    return favmealsList.favourites.isNotEmpty
        ? Consumer(
            builder: (ctx, value, consumerChild) => ListView.builder(
              itemBuilder: (context, index) {
                return Dismissible(
                  background: Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.red,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (dir) {
                    favmealsList.deleteitem(index);
                  },
                  key: UniqueKey(),
                  child: Container(
                    margin:
                        EdgeInsets.only(left: 20, bottom: 5, top: 5, right: 20),
                    child: ListTile(
                      leading: Text(
                        "${index + 1} .",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        favmealsList.favourites[index].toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Swipe left to delete"),
                      trailing: Icon(
                        Icons.arrow_back,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
              itemCount: favmealsList.favouritesList.length,
            ),
          )
        : Center(
            child: Text(
              "You don't have any favourites",
              style: TextStyle(fontSize: 20),
            ),
          );
  }
}

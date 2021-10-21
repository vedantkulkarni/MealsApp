import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/tabs_screen.dart';
import 'package:provider/provider.dart';
import './providers/favourites_provider.dart';

class MealItem extends StatelessWidget {
  final String src;
  final String duration;
  final Complexity difficulty;
  final String title;
  final String id;
  final Function _setFavourites;
  final FavouritesProvider value;
  MealItem(this.src, this.duration, this.difficulty, this.title, this.id,
      this._setFavourites, this.value);

  String get complexity {
    if (difficulty == Complexity.Simple)
      return "Simple";
    else if (difficulty == Complexity.Hard)
      return "Hard";
    else
      return "Challenging";
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => FavouritesProvider(),
      child: InkWell(
        splashColor: Colors.lightBlue,
        onTap: () {
          Navigator.pushNamed(context, "/item_details_screen",
              arguments: [src, title, id]);
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 5,
          margin: EdgeInsets.all(15),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Stack(alignment: Alignment.center, children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    src,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black45,
                  ),
                )
              ]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        right: 15, bottom: 10, left: 15, top: 15),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 38,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.alarm,
                              color: Colors.purple,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${duration} min",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.settings,
                              color: Colors.orange,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "$complexity",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        InkWell(
                          splashColor: Theme.of(context).accentColor,
                          onTap: () {
                            // _setFavourites(id);
                            // DefaultTabController.of(context)!
                            //     .animateTo(1); //Very Very Imp to change tabs
                          },
                          child: Container(
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    value.addFavourite(title);
                                    print(title);
                                    print(value.favouritesList);
                                  },
                                  icon: Icon(Icons.favorite),
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Favourite",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

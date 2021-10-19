import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/tabs_screen.dart';

class MealItem extends StatefulWidget {
  final String src;
  final String duration;
  final Complexity difficulty;
  final String title;
  final String id;
  final Function _setFavourites;
  MealItem(this.src, this.duration, this.difficulty, this.title, this.id,
      this._setFavourites);

  @override
  State<MealItem> createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  String get complexity {
    if (widget.difficulty == Complexity.Simple)
      return "Simple";
    else if (widget.difficulty == Complexity.Hard)
      return "Hard";
    else
      return "Challenging";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.lightBlue,
      onTap: () {
        Navigator.pushNamed(context, "/item_details_screen",
            arguments: [widget.src, widget.title, widget.id]);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: EdgeInsets.all(15),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Image.network(
                widget.src,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(right: 15, bottom: 10, left: 15, top: 15),
                  child: Text(
                    widget.title,
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
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${widget.duration} min",
                            style: TextStyle(fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.settings,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "$complexity",
                            style: TextStyle(fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                      InkWell(
                        splashColor: Theme.of(context).accentColor,
                        onTap: () {
                          widget._setFavourites(widget.id);
                          DefaultTabController.of(context)!
                              .animateTo(1); //Very Very Imp to change tabs
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Favourite",
                                style: TextStyle(fontWeight: FontWeight.w200),
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
    );
  }
}

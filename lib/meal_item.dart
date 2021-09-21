import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';

class MealItem extends StatelessWidget {
  final String src;
  final String duration;
  final Complexity difficulty;
  final String title;
  final String id;
  String get complexity {
    if (difficulty == Complexity.Simple)
      return "Simple";
    else if (difficulty == Complexity.Hard)
      return "Hard";
    else
      return "Challenging";
  }

  MealItem(this.src, this.duration, this.difficulty, this.title,this.id);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor,
      onTap: () {
        Navigator.pushNamed(context, "/item_details_screen",
            arguments: [src, title, id]);
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
                src,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
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
                        "$duration min",
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
                      print("tap kiya bitch");
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
      ),
    );
  }
}

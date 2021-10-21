import 'package:flutter/material.dart';
import 'package:mealsapp/dummy_data.dart';
import 'package:mealsapp/models/meal.dart';
import 'recipe_list.dart';

class ItemDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> src =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    final Meal recipesList =
        DUMMY_MEALS.firstWhere((element) => element.id == src[2]);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          src[1],
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Container(
                padding: EdgeInsets.all(0),
                height: MediaQuery.of(context).size.height,
                child: ClipRRect(
                  child: Image.network(
                    src[0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                child: DraggableScrollableSheet(
                  minChildSize: 0.2,
                  maxChildSize: 0.6,
                  builder: (context, controller) => Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: ListView(
                      controller: controller,
                      children: [
                        SizedBox(
                          height: 50,
                          child: Center(
                            // margin: EdgeInsets.only(left: 20),
                            child: Text(
                              "Ingredients",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: ListView.builder(
                            controller: controller,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      maxRadius: 15,
                                      child: Text(
                                        (index + 1).toString(),
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    title: Text(
                                      recipesList.ingredients[index],
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  Divider(
                                    color: Theme.of(context).primaryColor,
                                    indent: 30,
                                    endIndent: 30,
                                    height: 3,
                                  )
                                ],
                              );
                            },
                            itemCount: recipesList.ingredients.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

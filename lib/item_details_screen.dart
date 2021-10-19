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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(0),
                height: MediaQuery.of(context).size.height * 0.4,
                child: ClipRRect(
                  child: Image.network(
                    src[0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Ingredients",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                      color: Colors.black),
                ),
              ),
              
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: ListView.builder(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

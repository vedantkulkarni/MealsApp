import 'package:flutter/material.dart';
import 'package:mealsapp/dummy_data.dart';
import 'package:mealsapp/models/meal.dart';
import './category_recipes.dart';

class ItemDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> src =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    final Meal recipesList =
        DUMMY_MEALS.firstWhere((element) => element.id == src[2]);

    return Scaffold(
      appBar: AppBar(
        title: Text(src[1]),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 0.4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    src[0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Divider(
                color: Colors.black45,
              ),
              Container(
                child: Text(
                  "Ingredients",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                color: Colors.black,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text((index + 1).toString()),
                          ),
                          title: Text(
                            recipesList.ingredients[index],
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        Divider(
                          color: Theme.of(context).primaryColor,
                          indent: 30,
                          endIndent: 30,
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

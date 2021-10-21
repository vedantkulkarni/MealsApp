import 'package:flutter/material.dart';
import 'package:mealsapp/providers/favourites_provider.dart';
import 'package:mealsapp/recipe_list.dart';
import 'package:mealsapp/favourites_screen.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List favourites = ["Vedant"];

  void _setfavourites(String id) {
    setState(() {
      favourites.add(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return ChangeNotifierProvider(
      create: (ctx)=>FavouritesProvider(),
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              args["title"]!,
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.category,
                    color: Colors.redAccent,
                  ),
                  text: 'Categories',
                ),
                Tab(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.lightBlue,
                  ),
                  text: 'Favourites',
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            CategoryRecipesScreen(_setfavourites),
            FavouritesScreen()
          ]),
        ),
      ),
    );
  }
}

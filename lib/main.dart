import 'package:flutter/material.dart';
import 'package:mealsapp/app_bar.dart';
import 'package:mealsapp/favourites_screen.dart';
import 'package:mealsapp/providers/app_bar_state_provider.dart';
import 'package:mealsapp/recipe_list.dart';
import 'package:mealsapp/item_details_screen.dart';
import 'package:mealsapp/tabs_screen.dart';
import 'package:provider/provider.dart';
import './home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx)=>AppBarBoolProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            accentColor: Colors.blueGrey,
    
            // canvasColor: Color.fromRGBO(255, 254, 229, 1),
            fontFamily: 'Raleway',
            textTheme: const TextTheme(
                headline1: TextStyle(fontSize: 25, color: Colors.black))),
        initialRoute: "/",
        routes: {
          "/": (ctx) => MyHomePage(),
          "/tabs_screen": (ctx) => TabsScreen(),
          "/item_details_screen": (ctx) => ItemDetailsScreen(),
          // "/favourites_screen": (ctx) => FavouritesScreen(),
        },
      ),
    );
  }
}

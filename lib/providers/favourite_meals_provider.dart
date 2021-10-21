import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteMealsProvider with ChangeNotifier {
  List<String> favouritesList = [];
  List<String> get listOfFavourites {
    return [...favouritesList];
  }

  void insertToList(String value) {
    listOfFavourites.insert(0, value);
    notifyListeners();
  }
}

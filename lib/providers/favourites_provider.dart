import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesProvider with ChangeNotifier {
  List<String> favourites = [];
  List<String> get favouritesList {
    return [...favourites];
  }

  void addFavourite(String s) {
    if (true) {
      favourites.insert(0, s);
      notifyListeners();
    }
  }

  void deleteitem(int index) {
    favourites.removeAt(index);
    notifyListeners();
  }
}

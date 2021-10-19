import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AppBarBoolProvider with ChangeNotifier {
  bool app_bar_toggle_state = false;
  List<String> searchItemList =
      []; // A list which continously updates as the user inputs the search value
  void changeState() {
    app_bar_toggle_state = !app_bar_toggle_state;
    notifyListeners();
  }

  void insertInList(String s) {
    print(s);
    searchItemList.insert(0, s);
    notifyListeners();
  }

  void clearList() {
    searchItemList.clear();
    notifyListeners();
  }
}

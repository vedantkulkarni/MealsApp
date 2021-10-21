import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:mealsapp/providers/app_bar_state_provider.dart';

class SearchAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  State<SearchAppBar> createState() => SearchAppBarState();
}

class SearchAppBarState extends State<SearchAppBar> {
  static const List<String> _mealCategories = [
    'Italian',
    'Quick & Easy',
    'Hamburgers',
    'German',
    'Light & Lovely',
    'Exotic',
    'Breakfast',
    'Asian',
    'French',
    'Summer'
  ];

  var searchIconState = Icon(
    Icons.search,
    size: 25,
  );
  bool state = false;
  final controller = new TextEditingController();

  void _toggleBetweenSearchAndDefaultState(
      BuildContext context, AppBarBoolProvider value) {
    if (value.app_bar_toggle_state == false) {
      value.changeState();
      setState(() {
        searchIconState = Icon(
          Icons.cancel,
          size: 25,
        );
      });
    } else {
      value.changeState();
      setState(() {
        controller.clear();
        value.clearList();
        searchIconState = Icon(
          Icons.search,
          size: 25,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AppBarBoolProvider value = Provider.of<AppBarBoolProvider>(context);
    return AppBar(
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      iconTheme: IconThemeData(color: Colors.black, size: 25),
      backgroundColor: Colors.transparent,
      title: !value.app_bar_toggle_state
          ? Text(
              "Meals App",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )
          : Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: controller,
                onChanged: (String input) {
                  print(input);
                  for (int i = 0; i < _mealCategories.length; i++) {
                    if (input != "") {
                      if (_mealCategories[i]
                          .toLowerCase()
                          .contains(input.toLowerCase())) {
                        if (!value.searchItemList
                            .contains(_mealCategories[i])) {
                          print(_mealCategories[i]);
                          value.insertInList(_mealCategories[i]);
                        }
                      }
                    } else if (input == "") {
                      value.clearList();
                    }
                  }
                },
                decoration: InputDecoration(),
                cursorHeight: 25.0,
              ),
            ),
      elevation: 0,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: IconButton(
              onPressed: () {
                _toggleBetweenSearchAndDefaultState(context, value);
              },
              icon: searchIconState),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mealsapp/app_bar.dart';
import 'package:mealsapp/main_drawer.dart';
import 'package:mealsapp/providers/app_bar_state_provider.dart';
import 'grid_view_categories.dart';
import 'dummy_data.dart';
import 'app_bar.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    AppBarBoolProvider value = Provider.of<AppBarBoolProvider>(context);
    print(value.app_bar_toggle_state);
    return Scaffold(
        appBar: SearchAppBar(),
        body: !value.app_bar_toggle_state
            ? Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  children: DUMMY_CATEGORIES.map((index) {
                    return CategoryItem(index.title, index.color, index.id);
                  }).toList(),
                ),
              )
            : Container(
                child: ListView.builder(
                  itemBuilder: (ctx, index) => ListTile(
                    title: Text(value.searchItemList[index]),
                  ),
                  itemCount: value.searchItemList.length,
                ),
              ),
        drawer: MainDrawer());
  }
}

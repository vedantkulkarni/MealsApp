import 'package:flutter/material.dart';
import 'package:mealsapp/recipe_list.dart';

import 'dummy_data.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem(this.title, this.color, this.id);

  get categoryImage {
    if (id == "c1")
      return "https://cdn-icons-png.flaticon.com/512/1404/1404945.png";

    if (id == "c2")
      return "https://cdn-icons-png.flaticon.com/512/4285/4285622.png";

    if (id == "c3")
      return "https://cdn-icons-png.flaticon.com/512/877/877951.png";

    if (id == "c4")
      return "https://cdn-icons-png.flaticon.com/512/3430/3430176.png";

    if (id == "c5")
      return "https://cdn-icons-png.flaticon.com/512/3768/3768550.png";

    if (id == "c6")
      return "https://cdn-icons-png.flaticon.com/512/5248/5248141.png";

    if (id == "c7")
      return "https://cdn-icons-png.flaticon.com/512/887/887359.png";

    if (id == "c8")
      return "https://cdn-icons-png.flaticon.com/512/3946/3946515.png";

    if (id == "c9")
      return "https://cdn-icons-png.flaticon.com/512/3187/3187471.png";

    if (id == "c10")
      return "https://cdn-icons-png.flaticon.com/512/3217/3217037.png";
  }

  get finalList {
    return DUMMY_MEALS.where((element) {
      return element.categories.contains(id);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.lightBlue,
        onTap: () => Navigator.pushNamed(context, "/tabs_screen",
            arguments: {"id": id, "title": title}),
        child: Container(
          padding: EdgeInsets.only(left: 20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 55,
                width: 55,
                child: Image.network(
                  categoryImage,
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Container(
                    child: Text("${finalList.length} Items"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

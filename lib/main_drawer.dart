import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 250,
            color: Colors.red,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Divider(),
              ListTile(
                title: Text("Developed by"),
                subtitle: Text(
                  "Vedant Kulkarni",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          )
        ],
      ),
    );
  }
}

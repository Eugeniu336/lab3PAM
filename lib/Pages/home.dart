import 'package:flutter/material.dart';
import 'package:untitled7/Widget/Search.dart';
import 'package:untitled7/Widget/WidgetLab.dart';
import 'package:untitled7/Widget/Button.dart';

import '../Widget/ListWines1.dart';
import '../Widget/ListWines2.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(0), // Removes any default padding
        children: [
          Header(),
          Search(),
          Container(
            margin: EdgeInsets.only(top: 10, left: 20),
            alignment: Alignment.centerLeft, // Align text at the start of the row
            child: const Text(
              "Shop wines by",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWines(typeWine: "Type", isActive: true),
              ButtonWines(typeWine: "Style", isActive: false),
              ButtonWines(typeWine: "Coutries", isActive: false),
              ButtonWines(typeWine: "Grape", isActive: false),
            ],
          ),
          HorizontalWineList(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Wine",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "view all",
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                ),
              )
            ],
          ),
          VerticalWineList(),
        ],
      ),
    );
  }
}

// ignore_for_file: sized_box_for_whitespace

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Ne yesem?",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: const FoodPart(),
      ),
    );
  }
}

class FoodPart extends StatefulWidget {
  const FoodPart({Key? key}) : super(key: key);

  @override
  State<FoodPart> createState() => _FoodPartState();
}

class _FoodPartState extends State<FoodPart> {
  int soopNo = 1, tatliNo = 1, foodNo = 1;

  List<String> soupNames = ["Mercimek","Tarhana","TavukSuyu","Dügün","Yoğurt"];

  changeFood() {
    setState(() {
      foodNo = Random().nextInt(5) + 1;
      tatliNo = Random().nextInt(5) + 1;
      soopNo = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateColor.resolveWith((states) => Colors.white),
                ),
                onPressed: changeFood,
                child: Image.asset("assets/images/corba_$soopNo.jpg")),
          ),
        ),
        Text(
          soupNames[soopNo-1], 
          style: const TextStyle(fontSize: 15),
        ),
        Container(
          width: 100,
          child: const Divider(
            height: 5,
            color: Colors.black,
          )
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateColor.resolveWith((states) => Colors.white),
                ),
                onPressed: changeFood,
                child: Image.asset("assets/images/yemek_$foodNo.jpg")),
          ),
        ),
         Text(
          soupNames[foodNo-1], 
          style: const TextStyle(fontSize: 15),
        ),
        Container(
          width: 100,
          child: const Divider(
            height: 5,
            color: Colors.black,
          )
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateColor.resolveWith((states) => Colors.white),
                ),
                onPressed: changeFood,
                child: Image.asset("assets/images/tatli_$tatliNo.jpg")),
          ),
        ),
         Text(
          soupNames[tatliNo-1], 
          style: const TextStyle(fontSize: 15),
        ),
        Container(
          width: 100,
          child: const Divider(
            height: 5,
            color: Colors.black,
          )
        )
      ],
    ));
  }
}

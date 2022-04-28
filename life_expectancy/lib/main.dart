import 'package:flutter/material.dart';

import 'input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  //the themeData propertys that we give to materialApp effects every pages in the app
     /*  theme: ThemeData(
        colorScheme: const ColorScheme.light().copyWith(primary: Colors.red),  //it effects the appbar
        accentColor:Colors.pink,
      ), */

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lightBlue[300],
        primaryColor: Colors.lightBlue[300],
      ),
      home: const InputPage(),
    );
  }
}
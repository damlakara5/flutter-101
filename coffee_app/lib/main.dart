// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.brown[300],
        body: SafeArea(
          child: Center(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              mainAxisSize: MainAxisSize.min, //Normally column widget ocuupy all the spaces it can occupy 
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const CircleAvatar(
                  radius: 70.0,
                  backgroundImage: AssetImage("assets/img/white-coffee-cup-roasted-coffee-beans-around_35570-794.jpg"),
                ),
                 Text("CoffeCup",
                  style: GoogleFonts.roboto(
                    color: Colors.brown,
                    fontSize: 30,
                  ),
               ),
                const SizedBox(height: 10.0,),
                 Text("A cup away..".toUpperCase(),
                  style: GoogleFonts.alef(
                    color: Colors.white,
                  ),
               ),
              Container(
                width: 200,  //divider doesn't have a width property so we wrap with container that we can specify ıts width
                child: Divider(
                  height: 30, 
                  color: Colors.brown[900],
                )
              ),
               Card(
                 color: Colors.brown[900],
                 margin: const EdgeInsets.symmetric(
                   horizontal: 40.0,
                 ),
                
                 // ignore: prefer_const_literals_to_create_immutables
                 child: const ListTile(
                   leading: Icon(
                     Icons.email,
                     color: Colors.white,
                    ) ,
                   title: Text("sjdajdl@gmail.com ",
                      style:TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ) ,
                    ) ,
                 )
               ),
               const SizedBox(height: 10.0,),
                Card(
                 color: Colors.brown[900],
                 margin: const EdgeInsets.symmetric(
                   horizontal: 40.0,
                 ),
                 // ignore: prefer_const_literals_to_create_immutables
                 child:const ListTile(
                   leading:Icon(
                     Icons.phone, 
                     color: Colors.white,
                    ) ,
                   title: Text("+90 555 55 55 ",
                      style:TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ) ,
                    ) ,
                 )
               )
              ],
            ),
          )
        ),
      )
    );
  }
}

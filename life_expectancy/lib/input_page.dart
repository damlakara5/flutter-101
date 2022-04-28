// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'result_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? selectedGender;
  double numberOfCigarettes = 0.0;
  double sportDay = 3.0;
  int height = 170;
  int weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'YAŞAM BEKLENTİSİ',
            style: TextStyle(color: Colors.black54),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment
              .stretch, //not to resize itself horizontally according to the element, to ocuppy as much space as possible
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      child: rowOutlined("HEIGHT"),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      child: rowOutlined("WEİGHT"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("How many days do you workout per week?",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold)),
                  Text("${sportDay.round()}",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold)),
                  Slider(
                    value: sportDay,
                    onChanged: (double newValue) {
                      setState(() {
                        sportDay = newValue;
                      });
                    },
                    min: 0,
                    max: 7,
                  )
                ],
              ),
            )),
            Expanded(
                child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("How many cigarattes do you smoke per day?",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold)),
                  Text("${numberOfCigarettes.round()}",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold)),
                  Slider(
                    value: numberOfCigarettes,
                    onChanged: (double newValue) {
                      setState(() {
                        numberOfCigarettes = newValue;
                      });
                    },
                    min: 0,
                    max: 30,
                  )
                ],
              ),
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: MyContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = "WOMAN";
                      });
                    },
                    color: selectedGender == "WOMAN"
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: BottomColumns(
                        icon: FontAwesomeIcons.venus, gender: "WOMAN"),
                  )),
                  Expanded(
                      child: MyContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = "MAN";
                      });
                    },
                    color: selectedGender == "MAN"
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: BottomColumns(
                        icon: FontAwesomeIcons.mars, gender: "MAN"),
                  )),
                ],
              ),
            ),
           SizedBox(height: 50,child: TextButton(onPressed: (){
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ResultPage()));
           }, child: const Text("Count"), style: ButtonStyle( backgroundColor: MaterialStateProperty.all(Colors.white),) ))
          ],
        ));
  }

  Row rowOutlined(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            )),
        const SizedBox(
          width: 10,
        ),
        RotatedBox(
            quarterTurns: -1,
            child: Text( text=="HEIGHT"? "$height" : "$weight",
                style: const TextStyle(
                    fontSize: 40,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold))),
        const SizedBox(
          width: 25,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.lightBlue),
                    ),
                    onPressed: () {
                      setState(() {
                        text=="HEIGHT"? height++ : weight++;
                      });
                    },
                    child: const Icon(
                      FontAwesomeIcons.plus,
                      size: 10,
                    ))),
            ButtonTheme(
                minWidth: 36,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.lightBlue),
                    ),
                    onPressed: () {
                      setState(() {
                        text=="HEIGHT"? height-- : weight--;
                      });
                    },
                    child: const Icon(
                      FontAwesomeIcons.minus,
                      size: 10,
                    ))),
          ],
        )
      ],
    );
  }
}

class BottomColumns extends StatelessWidget {
  final IconData? icon;
  final String gender;

  BottomColumns({this.gender = "", this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, //center verticallly
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          gender,
          style: TextStyle(
              fontSize: 20, color: Colors.black54, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class MyContainer extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final Function()? onPress;
  // ignore: prefer_const_constructors_in_immutables
  MyContainer({Key? key, this.color = Colors.white, this.child, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: const SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

const Icon trueChoice = Icon(
  Icons.mood,
  color: Colors.green,
);

const Icon falseChoice = Icon(
  Icons.mood,
  color: Colors.red,
);

class SoruSayfasi extends StatefulWidget {
  const SoruSayfasi({Key? key}) : super(key: key);

  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  List<String> questions = [
    "1.Titanic gelmiş geçmiş en büyük gemidir",
    "2.Dünyadaki tavuk sayısı insan sayısından fazladır",
    "3.Kelebeklerin ömrü bir gündür",
    "4.Dünya düzdür",
    "5.Kaju fıstığı aslında bir meyvenin sapıdır",
    "6.Fatih Sultan Mehmet hiç patates yememiştir",
    "7.Fransızlar 80 demek için, 4 - 20 der",
  ];
  List<bool> answers = [false, true, false, false, true, true];
  int index = 0;

  void buttonFunction(bool choosen) {
    if (finalQuestion()) {

      showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: const Text("Test is over!"),
          //content: const Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: const Text("Restart"),
              onPressed: () {
                Navigator.of(context).pop();

                 setState(() {
                  index = 0;
                  secimler = [];
                });
              },
            ),
          ],
        );
      },
    );

   
    } else {
      setState(() {
        answers[index] == choosen
            ? secimler.add(trueChoice)
            : secimler.add(falseChoice);
        index++;
      });
    }
  }

  bool finalQuestion() {
    if (index + 1 >= questions.length) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[index],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          //when it doesn't fit in the line it goes to the bottom line
          /*  direction: Axis.vertical  , */
          spacing: 2, // horiizontal margin
          runSpacing: 2, //vertical margin
          /*     alignment: WrapAlignment.end, */
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all(const EdgeInsets.all(12)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red[400]),
                          ),
                          child: const Icon(Icons.thumb_down,
                              size: 30.0, color: Colors.white),
                          onPressed: () {
                            buttonFunction(false);
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all(const EdgeInsets.all(12)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green[400]),
                          ),
                          child: const Icon(Icons.thumb_up,
                              size: 30.0, color: Colors.white),
                          onPressed: () {
                            buttonFunction(true);
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}

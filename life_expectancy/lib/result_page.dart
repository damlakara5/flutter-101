import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Result Page")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            flex: 8,
            child: Center(child: Text("data",style: TextStyle(
                        fontSize: 40,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold)) ,),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("back",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                )),
          ),
        ],
      ),
    );
  }
}

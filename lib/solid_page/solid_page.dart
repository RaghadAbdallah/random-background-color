import 'dart:math';

import 'package:flutter/material.dart';

class SolidScreen extends StatefulWidget {
  const SolidScreen({Key? key}) : super(key: key);

  @override
  State<SolidScreen> createState() => _SolidScreenState();
}

class _SolidScreenState extends State<SolidScreen> {
  Color backgroundColor = Colors.white;

  void changeBackgroundColor() {
    setState(() {
      backgroundColor = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    double heightSize = MediaQuery.of(context).size.height;
    double widthSize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: InkWell(
        onTap: () {
          changeBackgroundColor();
        },
        child: Container(
          color: backgroundColor,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello There',
                  style: TextStyle(
                      fontSize: widthSize * 0.1, fontFamily: 'IndieFlower'),
                  textScaleFactor: MediaQuery.of(context).textScaleFactor * 1.2,
                ),
                IconButton(
                    onPressed: () {
                      createSnackBar(
                          'This App to change background color with random colors');
                    },
                    icon: Icon(
                      Icons.notes,
                      size: widthSize * 0.09,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createSnackBar(String message) {
    final snackBar = SnackBar(
        content: Text(
          message,
          style:
              TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05, fontFamily: 'IndieFlower'),
          textScaleFactor: MediaQuery.of(context).textScaleFactor * 1.2,
        ),
        backgroundColor: Colors.black45);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

import 'package:flutter_application/Text.dart';
import 'package:flutter_application/TextButton.dart';
import 'package:flutter_application/TextField.dart';
import 'package:flutter/material.dart';

class CurrencyConverterApp extends StatelessWidget {
  const CurrencyConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(205, 233, 234, 240),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textfile(),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: textfielfile(),
            ),
            textbuttonfile(),
          ],
        )),
      ),
    );
  }
}
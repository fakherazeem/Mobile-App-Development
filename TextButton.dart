import 'package:flutter/material.dart';

// ignore: camel_case_types
class textbuttonfile extends StatelessWidget {
  const textbuttonfile({super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        debugPrint('Pressed');
      },
      style: const ButtonStyle(
          backgroundColor:
              WidgetStatePropertyAll(Color.fromARGB(222, 3, 13, 80)),
          foregroundColor:
              WidgetStatePropertyAll(Color.fromARGB(222, 2, 10, 61)),
          fixedSize: WidgetStatePropertyAll(
            Size(200, 50),
          )),
      child: const Text(
        'Convert',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
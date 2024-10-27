import 'package:flutter/material.dart';

// ignore: camel_case_types
class textfielfile extends StatelessWidget {
  const textfielfile({super.key});
  @override
  Widget build(BuildContext context) {
    return const TextField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Enter amount to convert",
        hintStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(
          Icons.monetization_on,
          color: Colors.white,
        ),
        filled: true,
        fillColor: Color.fromARGB(222, 1, 10, 66),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(
              color: Color.fromARGB(222, 6, 15, 79),
              width: 2.0,
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignCenter,
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(
            color: Color.fromARGB(222, 1, 11, 75),
            width: 2.0,
            style: BorderStyle.solid,
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
        ),
      ),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
    );
  }
}
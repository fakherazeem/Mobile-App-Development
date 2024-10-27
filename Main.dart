// ignore: file_names
import 'package:flutter_application/currency_converter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

// ignore: camel_case_types
class Myapp extends StatelessWidget {
  const Myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CurrencyConverterApp(),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
var arrayItem=[
  "fakher",
  "shehroz",
  "saad",
  "noor",
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:ListView.separated(     
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder:(context,index){
            return Text(arrayItem[index]);
          },
      itemCount:arrayItem.length,
      ),
       ),
    ); }
}


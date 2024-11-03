
import 'package:flutter/material.dart';

void main(){
  runApp (MyApp());
  
  }

  class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(

              color: Colors.black,
              borderRadius: BorderRadius.circular(150)
            ),
            child: Center(
             child: Container(
            width: 260,
            height: 160,
            decoration: BoxDecoration(

              color: const Color.fromARGB(255, 32, 12, 211),
              borderRadius: BorderRadius.circular(130)
            ),
            child: Center(
             child: Container(
            width: 220,
            height: 130,
            decoration: BoxDecoration(

              color: const Color.fromARGB(255, 224, 67, 5),
              borderRadius: BorderRadius.circular(110)
            ),
            child: Center(
             child: Container(
            width: 180,
            height: 100,
            decoration: BoxDecoration(

              color: const Color.fromARGB(255, 2, 77, 21),
              borderRadius: BorderRadius.circular(90)
            ),
            child: Center(
             child: Container(
            width: 140,
            height: 70,
            decoration: BoxDecoration(

              color: const Color.fromARGB(255, 165, 158, 158),
              borderRadius: BorderRadius.circular(70)
            ),
            child: Center(

             child: Container(
            width: 100,
            height: 50,
            decoration: BoxDecoration(

              color: const Color.fromARGB(255, 238, 236, 236),
              borderRadius: BorderRadius.circular(50)
            
   ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                  ),
                ),
    ),
            
            ),
            ),
        )
        ),
            );
  }
}
     
  
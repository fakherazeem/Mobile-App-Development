import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      // body: Padding(
      //  padding:  const EdgeInsets.all(8.0),
      // child: Container(
      //   width: double.infinity,
      //   height: 100,
      //   color: const Color.fromARGB(255, 136, 103, 114),
      //   child: Image.asset('assets/images/img1.jpg'),
      
      // body: Row(children: [
      //   Container(
      //     width: 100,
      //     height: 100,
      //     color: const Color.fromARGB(255, 18, 1, 94),
      //   )
      // ],)
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                child : Row( children : [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width:100,
                      height:100,
                      color: const Color.fromARGB(255, 18, 1, 94),
                
                    ),
                    ),
                           Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width:100,
                      height:100,
                      color: const Color.fromARGB(255, 85, 82, 99),
                
                    ),
                    ),
                           Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width:100,
                      height:100,
                      color: const Color.fromARGB(255, 18, 1, 94),
                
                    ),
                    ),
                           Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width:100,
                      height:100,
                      color: const Color.fromARGB(255, 18, 1, 94),
                
                    ),
                    ),
                           Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width:100,
                      height:100,
                      color: const Color.fromARGB(255, 18, 1, 94),
                
                    ),
                    ),
                           Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width:100,
                      height:100,
                      color: const Color.fromARGB(255, 18, 1, 94),
                
                    ),
                    ),
                           Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width:100,
                      height:100,
                      color: const Color.fromARGB(255, 18, 1, 94),
                
                    ),
                    ),
                           Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width:100,
                      height:100,
                      color: const Color.fromARGB(255, 18, 1, 94),
                
                    ),
                    ),
                           Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width:100,
                      height:100,
                      color: const Color.fromARGB(255, 18, 1, 94),
                
                    ),
                    ),
                           Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width:100,
                      height:100,
                      color: const Color.fromARGB(255, 18, 1, 94),
                
                    ),
                    ),
                           Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width:100,
                      height:100,
                      color: const Color.fromARGB(255, 18, 1, 94),
                
                    ),
                    ),
                           Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width:100,
                      height:100,
                      color: const Color.fromARGB(255, 18, 1, 94),
                
                    ),
                    ),
                           Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width:100,
                      height:100,
                      color: const Color.fromARGB(255, 18, 1, 94),
                
                    ),
                    ),
                ]
                ),
            ),
            Padding(

                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding:  const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                      color: const Color.fromARGB(255, 18, 1, 94),
                          ),
                          ),
                            Padding(
                          padding:  const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                      color: const Color.fromARGB(255, 18, 1, 94),
                          ),
                          ),
                            Padding(
                          padding:  const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                      color: const Color.fromARGB(255, 18, 1, 94),
                          ),
                          ),
                            Padding(
                          padding:  const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                      color: const Color.fromARGB(255, 18, 1, 94),
                          ),
                          ),
                          Padding(
                          padding:  const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                      color: const Color.fromARGB(255, 18, 1, 94),
                          ),
                          ),
                          Padding(
                          padding:  const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                      color: const Color.fromARGB(255, 18, 1, 94),
                          ),
                          ),
                          Padding(
                          padding:  const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                      color: const Color.fromARGB(255, 18, 1, 94),
                          ),
                          ),
                          Padding(
                          padding:  const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                      color: const Color.fromARGB(255, 18, 1, 94),
                          ),
                          ),
                          Padding(
                          padding:  const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                      color: const Color.fromARGB(255, 18, 1, 94),
                          ),
                          ),

                          Padding(
                          padding:  const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                      color: const Color.fromARGB(255, 18, 1, 94),
                          ),
                          ),
                          
                      ],
                    ),
       ),
          ],
        ),
      )
      ); 
  }
} 
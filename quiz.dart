import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CURRENCY CONVERTER APP',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 26, 1, 70)),
        useMaterial3: true,
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
      
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
      ),
      body: const Center(
  
        child: Column(
      
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter amount to convert:',
              style: TextStyle(
                fontSize: 20
                
              ),
            ),
            
          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


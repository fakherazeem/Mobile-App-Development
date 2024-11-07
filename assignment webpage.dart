// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Assignment'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ 
                        Container(
                          width: 400, 
                          height: 100, 
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black), 
                          ),
                          child: const Center(
                            child: Text(
                              'Title',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 400, 
                          height: 100, 
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black), 
                          ),
                          child: const Center(
                            child: Text(
                              'Description',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),     
                  // Image box
                  Container(
                    height: 200,
                    width: 400,
                  child: Image.asset('assets/images/img1.JPG'), 
                  
                                    ),  
                ],
                
              ),
             Container(
                          width: 1500,
                          height: 300, 
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black), 
                          ),
                          
                            child: Container(
                              width: 300,
                          height: 300, 
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black), 
                          ),

          child: Column(
          children: [
            
                 Row(
                   children : [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    
                    child: Container(
                      
                      width:100,
                      height:100,
                      color: const Color.fromARGB(255, 187, 4, 29),
                
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
                      color: const Color.fromARGB(255, 3, 0, 17),
                
                    ),
                    ),
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width:100,
                      height:100,
                      color: const Color.fromARGB(255, 80, 1, 1),
                
                    ),
                    
                    ),
                     const SizedBox(height: 10),
                        Container(
                          width: 500, 
                          height: 100, 
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black), 
                          ),
                          child: const Center(
                            child: Text(
                              'Contact Us',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                    ]
          
                            ),
          ],
                            )
                            
                            
            
            
          ),
        ),
      
            ],),),),  
    );
  }
}

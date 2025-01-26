import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> productArray = [];

  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  Future<void> getAllProducts() async {
    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/AdminDashboard/GetAllProducts/'),
    );
    if (response.statusCode == 200) {
      setState(() {
        productArray = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background to black
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            color: Colors.orange, // Orange banner background
            child: const Text(
              'We Deal In Quality Products Only',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Text color for contrast
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: constraints.maxWidth > 600 ? 3 : 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: productArray.length,
                    itemBuilder: (context, index) {
                      final product = productArray[index];
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/productdetail',
                            arguments: {'id': product['id']},
                          );
                        },
                        child: Card(
                          color: Colors.grey[900], // Card background in dark gray
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(200),
                                    topRight: Radius.circular(200),
                                    
                                  ),
                                  child: Image.network(
                                    product['image'],
                                    
                                    // fit: BoxFit.cover,
                                    // width: double.infinity,
                                    
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product['name'],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange, // Orange text
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      product['description'],
                                      style: TextStyle(
                                        color: Colors.grey[400], // Light gray for secondary text
                                        fontSize: 12,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '\$${product['price']}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange, // Orange price text
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductManagement extends StatefulWidget {
  const ProductManagement({super.key});

  @override
  State<ProductManagement> createState() => _ProductManagementState();
}

class _ProductManagementState extends State<ProductManagement> {
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  Future<void> getAllProducts() async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:8000/AdminDashboard/GetAllProducts/'),
      );
      if (response.statusCode == 200) {
        setState(() {
          products = jsonDecode(response.body);
        });
      } else {
        debugPrint('Failed to fetch products: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint('Error fetching products: $error');
    }
  }

  Future<void> handleDeleteProduct(int id) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text('Are you sure you want to delete this product?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        final response = await http.delete(
          Uri.parse('http://localhost:8000/AdminDashboard/GetProductById/$id/'),
        );

        if (response.statusCode == 200) {
          getAllProducts();
        } else {
          debugPrint('Failed to delete product: ${response.statusCode}');
        }
      } catch (error) {
        debugPrint('Error deleting product: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Dashboard'),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.black,
      body: products.isEmpty
          ? const Center(
              child: Text(
                'No products available',
                style: TextStyle(color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  color: Colors.orange[100],
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    leading: product['image'] != null
                        ? Image.network(
                            product['image'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.image, color: Colors.orange),
                    title: Text(
                      product['name'],
                      style: const TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      product['description'],
                      style: const TextStyle(color: Colors.black54),
                    ),
                    trailing: Text(
                      'Rs. ${product['price']}',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

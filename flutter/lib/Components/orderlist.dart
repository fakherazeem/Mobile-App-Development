import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List<dynamic> orders = [];

  @override
  void initState() {
    super.initState();
    getAllOrders();
  }

  Future<void> getAllOrders() async {
    try {
      final response = await http
          .get(Uri.parse('http://localhost:8000/AdminDashboard/GetAllOrders/'));
      if (response.statusCode == 200) {
        setState(() {
          orders = jsonDecode(response.body);
        });
      } else {
        debugPrint('Error fetching orders: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching orders: $e');
    }
  }

  Future<void> deleteOrder(int orderId) async {
    try {
      final response = await http.delete(
        Uri.parse('http://localhost:8000/AdminDashboard/DeleteOrder/$orderId/'),
      );
      if (response.statusCode == 200) {
        setState(() {
          orders.removeWhere((order) => order['id'] == orderId);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Order deleted successfully')),
        );
      } else {
        debugPrint('Error deleting order: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to delete order')),
        );
      }
    } catch (e) {
      debugPrint('Error deleting order: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred while deleting the order')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Order Dashboard'),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.black,
      body: orders.isEmpty
          ? const Center(
              child: Text(
                'No Orders Placed',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Card(
                  color: Colors.orange[100],
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Order Header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Order #${order['id']}',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                            Text(
                              DateTime.parse(order['created_at'])
                                  .toLocal()
                                  .toString()
                                  .split(' ')[0],
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                          ],
                        ),
                        const Divider(color: Colors.black),
                        // Customer Info
                        Text(
                          'Customer: ${order['username']}',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        const SizedBox(height: 8),
                        // Products List
                        Text(
                          'Products:',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        const SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: (order['products'] as List).length,
                          itemBuilder: (context, productIndex) {
                            final product = order['products'][productIndex];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product['name'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    product['description'],
                                    style: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text(
                                    'Rs. ${product['price']}',
                                    style: const TextStyle(
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        const Divider(color: Colors.black),
                        // Total Price and Delete Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total: Rs. ${order['total_price']}',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                deleteOrder(order['id']);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
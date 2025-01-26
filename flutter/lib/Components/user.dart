import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    getAllUsers();
  }

  Future<void> getAllUsers() async {
    try {
      final response = await http
          .get(Uri.parse('http://localhost:8000/AdminDashboard/GetAllUsers/'));
      if (response.statusCode == 200) {
        setState(() {
          users = jsonDecode(response.body);
        });
      }
    } catch (e) {
      print('Error fetching users: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Admin User Dashboard'),
      ),
      backgroundColor: Colors.black,
      body: users.isEmpty
          ? const Center(
              child: Text(
                'No Users Found',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: DataTable(
                  columns: const [
                    DataColumn(
                      label: Text(
                        'User ID',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Name',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Email',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                  ],
                  rows: users.map((user) {
                    return DataRow(
                      cells: [
                        DataCell(
                          Text(
                            '#${user['id']}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        DataCell(
                          Text(
                            user['username'],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        DataCell(
                          Text(
                            user['email'],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username = '';
  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final storedUsername = await storage.read(key: 'username');
    setState(() {
      username = storedUsername ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Profile'),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          username.isNotEmpty ? 'Logged in as: $username' : 'No user logged in',
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}

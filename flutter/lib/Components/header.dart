import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Header extends StatefulWidget implements PreferredSizeWidget {
  final int cartItemCount;

  const Header({Key? key, required this.cartItemCount}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HeaderState extends State<Header> {
  bool isMenuOpen = false;
  bool isDropdownOpen = false;
  String username = '';
  String role = '';
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

  void _logout() async {
    await storage.deleteAll();
    setState(() {
      username = '';
      role = '';
      isDropdownOpen = false;
    });
    Navigator.pushNamed(context, '/login'); // Navigate to login
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: const Text(
          'Chunkin',
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.orange),
          onPressed: () {
            Navigator.pushNamed(context, '/search');
          },
        ),
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.orange),
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
            if (widget.cartItemCount > 0)
              Positioned(
                right: 8,
                top: 8,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                  child: Text(
                    '${widget.cartItemCount}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.person, color: Colors.orange),
          onPressed: () {
            Navigator.pushNamed(context, '/signup');
          },
        ),
        PopupMenuButton<String>(
          color: Colors.black,
          icon: const Icon(Icons.more_vert, color: Colors.orange),
          onSelected: (value) {
            if (value == 'logout') _logout();
            if (value == 'profile') Navigator.pushNamed(context, '/profile');
            if (value == 'users' && username == 'admin') {
              Navigator.pushNamed(context, '/userslist');
            }
            if (value == 'orders' && username == 'admin') {
              Navigator.pushNamed(context, '/orders');
            }
            if (value == 'products' && username == 'admin') {
              Navigator.pushNamed(context, '/product');
            }
          },
          itemBuilder: (BuildContext context) {
            final List<PopupMenuEntry<String>> items = [];
            if (username == 'admin') {
              items.add(
                const PopupMenuItem<String>(
                  value: 'users',
                  child: Text(
                    'Users',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              );
              items.add(
                const PopupMenuItem<String>(
                  value: 'orders',
                  child: Text(
                    'Orders',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              );
              items.add(
                const PopupMenuItem<String>(
                  value: 'products',
                  child: Text(
                    'Products',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              );
            } else {
              items.add(
                const PopupMenuItem<String>(
                  value: 'profile',
                  child: Text(
                    'Profile',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              );
            }
            items.add(
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            );
            return items;
          },
        ),
      ],
    );
  }
}

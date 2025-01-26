import 'package:flutter/material.dart';
import 'package:semester_project/Components/header.dart';
import 'package:semester_project/providers/cart_provider.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartItemCount = CartProviderWidget.of(context).cartItemCount;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Header(cartItemCount: cartItemCount),
      ),
      body: Container(
        color: Colors.black,
        child: child,
      ),
    );
  }
}
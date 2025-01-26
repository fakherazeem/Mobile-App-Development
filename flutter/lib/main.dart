// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:semester_project/Components/mainlayout.dart';
import 'Components/home.dart';
import 'Components/cart.dart';
import 'Components/checkout.dart';
import 'Components/login.dart';
import 'Components/signup.dart';
import 'Components/product.dart';
import 'Components/product_detail.dart';
import 'Components/orderlist.dart';
import 'Components/user.dart';
import 'Components/user_profile.dart';
import 'providers/cart_provider.dart';

void main() {
  runApp(CartProviderWidget(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black,
          elevation: 1,
        ),
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.orange),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange, width: 2),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black, backgroundColor: Colors.orange,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.orange,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainLayout(child: Home()),
        '/login': (context) => const MainLayout(child: Login()),
        '/signup': (context) => const MainLayout(child: SignUp()),
        '/cart': (context) => const MainLayout(child: Cart()),
        '/checkout': (context) => const MainLayout(child: Checkout()),
        '/product': (context) => const MainLayout(child: ProductManagement()),
        '/productdetail': (context) => const MainLayout(child: ProductDetail()),
        '/orders': (context) => const MainLayout(child: OrderList()),
        '/userslist': (context) => const MainLayout(child: UserDetails()),
        '/profile': (context) => const MainLayout(child: Profile()),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tester/pages/product_page.dart';
import 'package:provider_tester/provider/cart_provider.dart';
import 'package:provider_tester/provider/favourite_provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => CartProvider()),
      ChangeNotifierProvider(create: (context) => FavouriteProvider()),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductPage(),
    );
  }
}

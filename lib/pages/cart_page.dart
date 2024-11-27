import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tester/provider/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
      ),
      body: Consumer(
        builder: (BuildContext context, CartProvider value, child) {
          return ListView.builder(
            itemCount: value.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("Title"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Price"),
                    Text("Price x quntity"),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.remove),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.remove_shopping_cart,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

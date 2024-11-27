import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tester/models/cart_model.dart';
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
              final CartModel indexCartModel =
                  value.items.values.toList()[index];
              return ListTile(
                title: Text(
                  indexCartModel.titile,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$${indexCartModel.price}",
                    ),
                    Text(
                      "\$${indexCartModel.price} x ${indexCartModel.quantity}",
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {
                        value.removeFromCart(indexCartModel.id);
                      },
                      icon: Icon(Icons.remove_shopping_cart),
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

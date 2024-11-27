import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tester/data/product_data.dart';
import 'package:provider_tester/models/product_model.dart';
import 'package:provider_tester/pages/cart_page.dart';
import 'package:provider_tester/pages/favourit_page.dart';
import 'package:provider_tester/provider/cart_provider.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final List<ProductModel> allProduct = ProductData().productList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter Shop",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.deepOrange,
          ),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: allProduct.length,
        itemBuilder: (context, index) {
          final ProductModel indexProdut = allProduct[index];
          return Card(
            child: Consumer(
              builder: (context, CartProvider provider, child) {
                return ListTile(
                  title: Row(
                    children: [
                      Text(
                        indexProdut.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        provider.items.containsKey(indexProdut.id)
                            ? provider.items[indexProdut.id]!.quantity
                                .toString()
                            : "0",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    "${indexProdut.price.toString()} \$",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border),
                      ),
                      IconButton(
                        onPressed: () {
                          provider.addToCard(
                            indexProdut.id,
                            indexProdut.title,
                            indexProdut.price,
                          );
                        },
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          color: provider.items.containsKey(indexProdut.id)
                              ? Colors.deepOrange
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 1,
            backgroundColor: Colors.deepOrange,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavouritPage(),
                ),
              );
            },
            child: const Center(
              child: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            heroTag: 2,
            backgroundColor: Colors.deepOrange,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
            child: const Center(
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

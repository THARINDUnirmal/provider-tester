import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tester/data/product_data.dart';
import 'package:provider_tester/models/product_model.dart';
import 'package:provider_tester/provider/favourite_provider.dart';

class FavouritPage extends StatelessWidget {
  const FavouritPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Page"),
      ),
      body: Consumer(
        builder: (context, FavouriteProvider favProvider, child) {
          return favProvider.favourit.isEmpty
              ? Center(
                  child: Text(
                  "Add some product to favourite !",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ))
              : ListView.builder(
                  itemCount: favProvider.favourit.length,
                  itemBuilder: (context, index) {
                    final productId = favProvider.favourit.keys.toList()[index];
                    final ProductModel pr =
                        ProductData().productList.firstWhere(
                              (element) => element.id == productId,
                            );
                    return ListTile(
                      title: Text(pr.title),
                      trailing: IconButton(
                        onPressed: () {
                          favProvider.removeFromFavourite(pr.id);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}

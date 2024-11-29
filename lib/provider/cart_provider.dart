import 'package:flutter/material.dart';
import 'package:provider_tester/models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  //create map
  Map<String, CartModel> _allItems = {};

  //create getter
  Map<String, CartModel> get items {
    return {..._allItems};
  }

  // add to cart methord
  void addToCard(String id, String title, double price) {
    if (_allItems.containsKey(id)) {
      _allItems.update(
        id,
        (value) => CartModel(
          id: value.id,
          titile: value.titile,
          price: value.price,
          quantity: value.quantity + 1,
        ),
      );
    } else {
      _allItems.putIfAbsent(
        id,
        () => CartModel(
          id: id,
          titile: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  //remove methord
  void removeFromCart(String id) {
    if (_allItems.containsKey(id)) {
      _allItems.remove(id);
    } else {
      return;
    }
    notifyListeners();
  }

  //minus methord
  void minusProduct(String id) {
    if (_allItems[id]!.quantity <= 1) {
      _allItems.remove(id);
    } else {
      _allItems.update(
        id,
        (value) => CartModel(
            id: value.id,
            titile: value.titile,
            price: value.price,
            quantity: value.quantity - 1),
      );
    }
    notifyListeners();
  }

  //clear all
  void clearAll() {
    _allItems = {};
    notifyListeners();
  }

  //calculation all products
  double get totalAmount {
    double total = 5.0;
    _allItems.forEach(
      (key, cartItem) {
        total += cartItem.price * cartItem.quantity;
      },
    );

    return total;
  }
}

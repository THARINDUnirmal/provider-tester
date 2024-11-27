import 'package:flutter/material.dart';

class FavouriteProvider extends ChangeNotifier {
  //state
  final Map<String, bool> _allFavourite = {};

  //getter
  Map<String, bool> get favourit {
    return {..._allFavourite};
  }

  //add to favourite methord
  void addToFavourite(String id) {
    // if (!_allFavourite.containsKey(id)) {
    //   return;
    // }
    if (_allFavourite.containsKey(id)) {
      _allFavourite[id] = !_allFavourite[id]!;
    } else {
      _allFavourite[id] = true;
    }
    notifyListeners();
  }

  //check item mis favourite
  bool isFavourite(String id) {
    if (_allFavourite.containsKey(id)) {
      return _allFavourite[id]!;
    } else {
      return false;
    }
  }

  //remove frome favourite
  void removeFromFavourite(String id) {
    if (_allFavourite.containsKey(id)) {
      _allFavourite.remove(id);
    }
    notifyListeners();
  }
}

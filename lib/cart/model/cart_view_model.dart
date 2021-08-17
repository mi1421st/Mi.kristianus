import 'package:flutter/material.dart';
import 'package:kulina/cart/model/cart_model.dart';
import 'package:kulina/model/products.dart';

class CartViewModel extends ChangeNotifier {
  Map <String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItemToCart(Products item){
    print(item);
    print(_items);
    if(_items.containsKey(item.id.toString())){
      _items.update(item.id.toString(), (existingItem) => CartItem(
        cartItem: existingItem.cartItem,
        qty: existingItem.qty! + 1,
      ));
    }
    else {
      _items.putIfAbsent(item.id.toString(), () => CartItem(
          cartItem: item,
          qty: 1,
      ));
      // print(_items['0']);
    }

    print(_items['0']!.cartItem);
    notifyListeners();
  }

  void dismissItem(String itemId) {
    _items.remove(itemId);
    notifyListeners();
  }

  void removeOneItemFromChart(String itemId) {
    if(!_items.containsKey(itemId)) {
      return ;
    }
    else if(_items[itemId]!.qty! > 1){
      _items.update(itemId, (value) => CartItem(
          cartItem: value.cartItem,
          qty: value.qty! - 1,
      ));
    }
    else if(_items[itemId]!.qty! == 1){
      dismissItem(itemId);
    }
    notifyListeners();
  }

  double get totalPrice {
    double total = 0;
    _items.forEach((key, value) {
      total += value.cartItem!.price * value.qty!;
    });

    return total;
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

}
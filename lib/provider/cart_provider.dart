import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CartProvider extends ChangeNotifier {
  List<Map<String, dynamic>> cart = [];
  int totalAmount = 0;

  final _myCart = Hive.box('mycart');

  void calculateTotal() {
    totalAmount = 0;
    for (int i = 0; i < cart.length; i++) {
      int price = int.parse(cart[i]['price']);
      int count = (cart[i]['count']);
      // print(price);
      // print(count);
      // print(totalAmount);
      totalAmount += (price * count);
    }
  }

  void addProduct(Map<String, dynamic> product) {
    cart.add(product);
    // print(cart);
    calculateTotal();
    _myCart.put(1,cart);
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> product) {
    cart.remove(product);
    calculateTotal();
    _myCart.put(1,cart);
    notifyListeners();
  }

  void incrementCount(int id) {
    // print(cart);
    final index = cart.indexWhere((element) => element['id'] == id);
    if (index != -1) {
      final tempCount = cart[index]['count'] as num;
      // print(tempCount);
      cart[index]['count'] = tempCount + 1;
      calculateTotal();

      notifyListeners();
    } else {
      // print('Item with id $id not found in the cart.');
      // Handle the case where the item is not found, e.g., display a message or log an error.
    }
  }

  void decrementCount(int id) {
    // print(cart);
    final index = cart.indexWhere((element) => element['id'] == id);
    if (index != -1) {
      final tempCount = cart[index]['count'] as num;
      // print(tempCount);
      if (tempCount > 1) {
        cart[index]['count'] = tempCount - 1;
        calculateTotal();
      }
      notifyListeners();
    } else {
      // print('Item with id $id not found in the cart.');
      // Handle the case where the item is not found, e.g., display a message or log an error.
    }
  }
}

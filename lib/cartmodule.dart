import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = const [
    ["assets/shoe1.png", "Air Vapour 24 Plus", "169.00"],
    ["assets/shoe2.png", "Air Force 2024", "289.00"],
    ["assets/shoe1.png", "Air Vapour 24 Plus", "169.00"],
    ["assets/shoe2.png", "Air Force 2024", "289.00"],
  ];

  final List _cartItems = [
    ["assets/shoe2.png", "Air Force 2024", "289.00"],
    ["assets/shoe1.png", "Air Vapour 24 Plus", "169.00"],
  ];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();

    // String Totalamount() {
    //   double totalPrice = 0;
    //   for (int i = 0; i < cartItems.length; i++) {
    //     totalPrice += double.parse(cartItems[i][2]);
    //   }
    //   return totalPrice.toStringAsFixed(2);
    // }
  }
}

import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ["Medical App", "30",],
    ["Events App", "30",],
    ["Ecommerce App", "35",],
    ["Authentication App", "25",],
  ];

  final List _cartItems = [];

  get cartItem => _cartItems;
  get shopItem => _shopItems;

  //add to cart
  void addToCart(int index){
    cartItem.add(shopItem[index]);
    notifyListeners();
  }
  //remove from cart
  void removeCartItem(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }
  // Check if an item is already in the cart
  bool isItemInCart(int index) {
    return cartItem.contains(shopItem[index]);
  }
  //Calculate Total
  String calculateTotalAmount(){
    double totalAmount = 0;
    for(int i=0; i<_cartItems.length; i++) {
      totalAmount += double.parse(cartItem[i][1]);
    }
    return totalAmount.toStringAsFixed(2);
  }
}
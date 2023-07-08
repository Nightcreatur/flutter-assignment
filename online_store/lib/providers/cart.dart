import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem>? _products = {};

  Map<String, CartItem> get products {
    return {..._products!};
  }

  int get itemCount {
    return _products == null ? 0 : _products!.length;
  }

  double get totalPrice {
    var tota = 0.0;
    _products!.forEach((key, value) {
      tota += value.price * value.quantity;
    });
    return tota;
  }

  void addItem(
    String productId,
    double price,
    String title,
  ) {
    if (_products!.containsKey(productId)) {
      _products!.update(
          productId,
          (value) => CartItem(
              id: value.id,
              title: value.id,
              quantity: value.quantity + 1,
              price: value.price));
    } else {
      _products!.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: price));
    }
    notifyListeners();
  }

  void removeProduct(String productId) {
    _products!.remove(productId);
    notifyListeners();
  }
}

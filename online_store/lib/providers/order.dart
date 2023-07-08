import 'package:flutter/material.dart';
import 'package:online_store/providers/cart.dart';

class OrderItem {
  final String id;

  final List<CartItem> products;
  final double price;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.products,
    required this.price,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  final List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartItem, double total) {
    _orders.insert(
      0,
      OrderItem(
          id: DateTime.now().toString(),
          products: cartItem,
          price: total,
          dateTime: DateTime.now()),
    );
    notifyListeners();
  }
}

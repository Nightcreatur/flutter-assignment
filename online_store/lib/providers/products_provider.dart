import 'package:flutter/material.dart';
import 'product.dart';

class Products with ChangeNotifier {
  final List<Product> _item = [
    Product(
        id: 'p1',
        title: 'tits',
        price: 20,
        description: '',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhndrPhPgXeV-E60sGmxPcXU2Fyeyo6XcpBcoHd8Is&s'),
    Product(
        id: 'p3',
        title: 'tits',
        price: 20,
        description: '',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhndrPhPgXeV-E60sGmxPcXU2Fyeyo6XcpBcoHd8Is&s'),
    Product(
        id: 'p2',
        title: 'title',
        price: 2000,
        description: '',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhndrPhPgXeV-E60sGmxPcXU2Fyeyo6XcpBcoHd8Is&s'),
    Product(
        id: 'p4',
        title: 'title',
        price: 20,
        description: '',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhndrPhPgXeV-E60sGmxPcXU2Fyeyo6XcpBcoHd8Is&s'),
    Product(
        id: 'p5',
        title: 'title',
        price: 20,
        description: '',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhndrPhPgXeV-E60sGmxPcXU2Fyeyo6XcpBcoHd8Is&s'),
  ];

  List<Product> get items {
    return [..._item];
  }

  Product findByid(String id) {
    return _item.firstWhere((element) => element.id == id);
  }

  void addProdut() {
    notifyListeners();
  }
}

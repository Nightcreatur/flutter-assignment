import 'package:flutter/material.dart';
import 'product.dart';

class Products with ChangeNotifier {
  final List<Product> _item = [
    Product(
        id: 'p1',
        title: 'Books',
        price: 20,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
        imageUrl:
            'https://static.vecteezy.com/system/resources/previews/009/399/398/original/old-vintage-book-clipart-design-illustration-free-png.png'),
    Product(
        id: 'p3',
        title: 'T-Shirt',
        price: 20,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhndrPhPgXeV-E60sGmxPcXU2Fyeyo6XcpBcoHd8Is&s'),
    Product(
        id: 'p2',
        title: 'Pant',
        price: 2000,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
        imageUrl:
            'https://np-live-21.slatic.net/kf/Scae1ec23b06043ee91b68eabace8cd3aV.jpg_300x0q75.webp'),
    Product(
        id: 'p4',
        title: 'Shoe',
        price: 20,
        description: '',
        imageUrl:
            'https://media.cnn.com/api/v1/images/stellar/prod/allbirds-sneakers-review-wool-runnerjpg.jpg?q=h_1090,w_1938,x_0,y_0'),
    Product(
        id: 'p5',
        title: 'T-shirt',
        price: 20,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhndrPhPgXeV-E60sGmxPcXU2Fyeyo6XcpBcoHd8Is&s'),
    Product(
        id: 'p6',
        title: 'Books',
        price: 20,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
        imageUrl:
            'https://static.vecteezy.com/system/resources/previews/009/399/398/original/old-vintage-book-clipart-design-illustration-free-png.png'),
    Product(
        id: 'p7',
        title: 'T-Shirt',
        price: 20,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhndrPhPgXeV-E60sGmxPcXU2Fyeyo6XcpBcoHd8Is&s'),
    Product(
        id: 'p8',
        title: 'Pant',
        price: 2000,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
        imageUrl:
            'https://np-live-21.slatic.net/kf/Scae1ec23b06043ee91b68eabace8cd3aV.jpg_300x0q75.webp'),
    Product(
        id: 'p9',
        title: 'Shoe',
        price: 20,
        description: '',
        imageUrl:
            'https://media.cnn.com/api/v1/images/stellar/prod/allbirds-sneakers-review-wool-runnerjpg.jpg?q=h_1090,w_1938,x_0,y_0'),
    Product(
        id: 'p10',
        title: 'T-shirt',
        price: 20,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
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

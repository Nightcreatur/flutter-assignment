import 'package:flutter/material.dart';
import 'package:online_store/providers/cart.dart';
import 'package:online_store/screens/cart_item_screen.dart';

import 'package:online_store/widget/cart_badge.dart';
import 'package:online_store/widget/side_drawer.dart';
import 'package:provider/provider.dart';
import '../widget/products_grid.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          Consumer<Cart>(
            builder: (_, cartData, __) => CartBadge(
              value: cartData.itemCount.toString(),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const CartScreen()));
                },
                icon: const Icon(Icons.shopping_bag_outlined),
              ),
            ),
          )
        ],
      ),
      body: const ProductsGrid(),
      drawer: const SideDrawer(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:online_store/auth/login_screen.dart';
import 'package:online_store/providers/product.dart';
import 'package:online_store/screens/cart_item_screen.dart';
import 'package:online_store/widget/colors.dart';
import 'package:online_store/widget/order_list.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../providers/products_provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findByid(productId);
    final cart = Provider.of<Cart>(context, listen: false);
    final mq = MediaQuery.of(context).size;
    return NavigationBar(
      elevation: 1,
      height: mq.height * .05,
      destinations: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
            onPressed: () {
              cart.addItem(
                  loadedProduct.id, loadedProduct.price, loadedProduct.title);
              Dialogs.showSnackBar(context, 'Added');
            },
            child: const Text(
              'Add to card',
              style: TextStyle(color: secondaryColor),
            )),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: darkP),
            onPressed: () {
              cart.addItem(
                  loadedProduct.id, loadedProduct.price, loadedProduct.title);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartScreen()),
              );
            },
            child:
                const Text('Buy Now', style: TextStyle(color: secondaryColor))),
      ],
    );
  }
}

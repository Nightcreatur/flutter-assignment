import 'package:flutter/material.dart';
import 'package:online_store/providers/cart.dart';
import 'package:online_store/providers/order.dart';
import 'package:online_store/screens/orders_screen.dart';
import 'package:online_store/widget/colors.dart';
import 'package:provider/provider.dart';

import '../widget/order_list.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCount = Provider.of<Cart>(context);
    final order = Provider.of<Orders>(context, listen: false);
    return Scaffold(
      appBar: AppBar(actions: [
        Center(child: Text('My cart (${cartCount.itemCount.toString()})'))
      ]),
      body: Column(children: [
        Card(
          elevation: 0.5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: 'Total: ',
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  TextSpan(
                      text: 'Rs. ${cartCount.totalPrice.toString()}',
                      style: const TextStyle(
                          color: darkP,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))
                ])),
                ElevatedButton(
                  onPressed: () {
                    if (cartCount.totalPrice == 0) {
                      return;
                    }

                    order.addOrder(
                      cartCount.products.values.toList(),
                      cartCount.totalPrice,
                    );

                    cartCount.clearItem();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const OrderScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: darkP, foregroundColor: secondaryColor),
                  child: Text('Check Out (${cartCount.itemCount.toString()})'),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemBuilder: (ctx, i) => OrderListItem(
                  productId: cartCount.products.keys.toList()[i],
                  id: cartCount.products.values.toList()[i].id,
                  qty: cartCount.products.values.toList()[i].quantity,
                  price: cartCount.products.values.toList()[i].price,
                  title: cartCount.products.values.toList()[i].title),
              itemCount: cartCount.products.length),
        )
      ]),
    );
  }
}

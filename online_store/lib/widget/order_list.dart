import 'package:flutter/material.dart';
import 'package:online_store/providers/cart.dart';
import 'package:online_store/widget/colors.dart';
import 'package:provider/provider.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem(
      {super.key,
      required this.title,
      required this.id,
      required this.price,
      required this.qty,
      required this.productId});
  final String title;
  final String productId;
  final String id;
  final double price;
  final int qty;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      onDismissed: (direction) {
        cart.removeProduct(productId);
      },
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: const Icon(
          Icons.delete_outline_outlined,
          color: secondaryColor,
          size: 40,
        ),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: Text('Rs. $price'),
            title: Text(title),
            subtitle: Text('Total: Rs. ${price * qty}'),
            trailing: Text('($qty) x'),
          ),
        ),
      ),
    );
  }
}

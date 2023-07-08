import 'package:flutter/material.dart';
import 'package:online_store/providers/order.dart';
import 'package:online_store/widget/orders_data.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Orders>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Orders'),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, i) => OrdersData(
            orders: order.orders[i],
          ),
          itemCount: order.orders.length,
        ));
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/order.dart';

class OrdersData extends StatefulWidget {
  const OrdersData({super.key, required this.orders});
  final OrderItem orders;

  @override
  State<OrdersData> createState() => _OrdersDataState();
}

class _OrdersDataState extends State<OrdersData> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          ListTile(
            title: Text('Rs.${widget.orders.price}'),
            subtitle: Text(
              DateFormat.yMEd().format(widget.orders.dateTime),
            ),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                icon: const Icon(
                  Icons.arrow_downward_rounded,
                )),
          ),
          if (_isExpanded)
            SizedBox(
              height: min(widget.orders.products.length * 20 + 90, 100),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: widget.orders.products
                      .map((e) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(e.title),
                              Text('${e.quantity}x Rs. ${e.price}')
                            ],
                          ))
                      .toList(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

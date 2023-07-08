import 'package:flutter/material.dart';
import 'package:online_store/widget/bottom_bar.dart';
import 'package:online_store/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({
    super.key,
  });

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    // final product = Provider.of<Product>(context, listen: false);
    final productId = ModalRoute.of(context)!.settings.arguments as String;

    final loadedProduct =
        Provider.of<Products>(context, listen: false).findByid(productId);
    return Scaffold(
      bottomNavigationBar: const BottomBar(),
      appBar: AppBar(),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          SizedBox(
            width: double.infinity,
            height: mq.height * .41,
            child: Image.network(
              loadedProduct.imageUrl,
              fit: BoxFit.fitHeight,
            ),
          ),
          const Divider(
            height: 15,
          ),
          Expanded(
            child: Card(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loadedProduct.title,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text("Rs ${loadedProduct.price.toString()}",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold)),
                  Text(loadedProduct.description),
                  Flexible(
                    flex: 2,
                    child: Container(),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}

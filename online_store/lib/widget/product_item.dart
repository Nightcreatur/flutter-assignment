import 'package:flutter/material.dart';
import 'package:online_store/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.price});
  final String id;
  final String title;
  final String imageUrl;
  final double price;

  @override
  Widget build(BuildContext context) {
    // return GridTile(
    //   footer: GridTileBar(
    //     backgroundColor: gridBarColor,
    //     title: Text(
    //       title,
    //       textAlign: TextAlign.center,
    //     ),
    //   ),
    //   child: Image.network(
    //     imageUrl,
    //     fit: BoxFit.cover,
    //   ),
    // );

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetail.routeName,
          arguments: id,
        );
      },
      child: Card(
        elevation: .2,
        child: Column(
          children: [
            Image.network(imageUrl),
            Text(title),
            Text(
              'Rs. ${price.toStringAsFixed(2)}',
              style: const TextStyle(
                  color: Color.fromARGB(255, 248, 108, 0),
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

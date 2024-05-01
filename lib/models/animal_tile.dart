import 'package:flutter/material.dart';
import 'package:talapets/models/productItem.dart'; // Importing the Product class

class AnimalTile extends StatelessWidget {
  final ProductItem product; // Corrected to use ProductItem

  const AnimalTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.asset(
          product.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(product.title),
        subtitle: Text(product.description),
        trailing: Text(product.price),
        onTap: () {
          // Handle onTap
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:productmart/model/productModel.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(product.image, height: 100, width: 100),
          Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
          Text('${product.price} \$'),
        ],
      ),
    );
  }
}

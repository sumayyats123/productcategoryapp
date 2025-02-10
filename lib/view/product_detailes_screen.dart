import 'package:flutter/material.dart';
import 'package:productcategory/model/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Center(
        child: Column(
          children: [
            Image.network(product.imageUrl,
                height: 200, width: 200, fit: BoxFit.cover),
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              product.price,
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
            Text(
              product.discount,
              style: const TextStyle(fontSize: 16, color: Colors.red),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}

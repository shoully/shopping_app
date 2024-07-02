import 'package:flutter/material.dart';
import 'product.dart';

class ProductsScreen extends StatelessWidget {
  final List<Product> products = [
    const Product("Shirt", 19.99),
    const Product("Shoes", 49.99),
    const Product("Hat", 14.99),
  ];

  final Function(Product) onAddToCart;

  ProductsScreen({required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
            trailing: IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () => onAddToCart(product),
            ),
          );
        },
      ),
    );
  }
}
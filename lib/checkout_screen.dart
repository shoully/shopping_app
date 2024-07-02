import 'package:flutter/material.dart';
import 'product.dart';
import 'order_success_screen.dart';

class CheckoutScreen extends StatelessWidget {
  final List<Product> cartItems;
  final Function(Product) onRemoveFromCart;

  const CheckoutScreen({super.key, required this.cartItems, required this.onRemoveFromCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final product = cartItems[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
            trailing: IconButton(
              icon: const Icon(Icons.remove_shopping_cart),
              onPressed: () => onRemoveFromCart(product),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => navigateToOrderSuccess(context),
        label: const Text("Order Successful"),
        icon: const Icon(Icons.check),
      ),
    );
  }

  void navigateToOrderSuccess(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OrderSuccessScreen()),
    );
  }
}
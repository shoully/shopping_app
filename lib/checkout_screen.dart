import 'package:flutter/material.dart';
import 'product.dart';
import 'order_success_screen.dart';

class CheckoutScreen extends StatelessWidget {
  final List<Product> cartItems;
  final Function(Product) onRemoveFromCart;

  CheckoutScreen({required this.cartItems, required this.onRemoveFromCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final product = cartItems[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () => onRemoveFromCart(product),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => navigateToOrderSuccess(context),
        label: Text("Order Successful"),
        icon: Icon(Icons.check),
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
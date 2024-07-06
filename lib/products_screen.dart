import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_provider.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gems Store'),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          // Check if data is loading
          if (provider.loading) {
            return Center(child: CircularProgressIndicator());
          }

          // Check for errors
          if (provider.error.isNotEmpty) {
            return Center(child: Text(provider.error));
          }

          // Display list of products
          return ListView.builder(
            itemCount: provider.products.length,
            itemBuilder: (context, index) {
              final product = provider.products[index];
              return Card(
                margin: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Display product image or placeholder
                      product.imageUrl.isNotEmpty
                          ? Image.network(
                        product.imageUrl,
                        height: 150.0, // Fixed height for image
                        width: double.infinity, // Full width
                        fit: BoxFit.cover, // Cover the space
                      )
                          : Container(
                        height: 150.0,
                        width: double.infinity,
                        color: Colors.grey[300], // Placeholder color
                      ),
                      SizedBox(height: 8.0), // Spacer
                      // Display product name
                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.0), // Spacer
                      // Display product description
                      Text(product.description),
                      SizedBox(height: 4.0), // Spacer
                      // Display product price
                      Text(
                        '\$${product.price.toStringAsFixed(2)}', // Format price to 2 decimal places
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green, // Price text color
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
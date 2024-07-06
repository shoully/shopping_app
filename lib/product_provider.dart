import 'package:flutter/material.dart';
import 'product_service.dart';
import 'product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _loading = false;
  String _error = '';

  List<Product> get products => _products;
  bool get loading => _loading;
  String get error => _error;

  ProductService _productService = ProductService();

  ProductProvider() {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    _loading = true;
    notifyListeners();

    try {
      _products = await _productService.fetchProducts();
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
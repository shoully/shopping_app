import 'dart:convert';
import 'package:http/http.dart' as http;
import 'product.dart';

class ProductService {
  final String baseUrl = 'https://api.timbu.cloud/products';
  final String organization_id = 'xx';
  final String Appid = 'xx';
  final String Apikey = 'xx';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl?organization_id=$organization_id&Appid=$Appid&Apikey=$Apikey'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['items'];
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
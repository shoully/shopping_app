import 'dart:convert';
import 'package:http/http.dart' as http;
import 'product.dart';

class ProductService {
  final String baseUrl = 'https://api.timbu.cloud/products';
  final String organization_id = '52078ccb9d264bcc859ed6d4ae4324b2';
  final String Appid = 'NJCY6D6E9U2A2VM';
  final String Apikey = 'f07342dd7c9e4d16bb479b74a896e5d920240706191541388806';

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
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:productcategory/model/product_model.dart';


class ProductService {
  static const String _baseUrl =
      'https://alpha.bytesdelivery.com/api/v3/product/category-products/123/null/1';

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final productsData = data['data']['products'];

        if (productsData != null) {
          return List<Product>.from(
            productsData.map((prod) => Product.fromJson(prod)),
          );
        }
      }
      throw Exception('Failed to load products');
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:productmart/model/productModel.dart';


Future<List<Product>> fetchProducts(int page, int startKm, int endKm) async {
  final String url = 'https://stag.vshopp.com/api/v1/categories/product-list'; // Replace with actual API endpoint
print("api called================>");
  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization': 'Bearer 2UFrWpJmym4Jp4qM0ZfnO46oqqrEBW1lsWMhlafq93M6hV4O9CLkbzejHW9D7SaKrb7yKRQ3p0fmCux24mlRgtLBqu8ehFZQNoh8sIie2jzofDe8OVTmGb56',
      "moduleId":"3"
    },
  );

  if (response.statusCode == 200) {
    final List productsJson = jsonDecode(response.body)['products'];
    return productsJson.map((product) => Product.fromJson(product)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}



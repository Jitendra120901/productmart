// lib/model/productModel.dart

class Product {
  final int id;
  final String name;
  final String imageUrl;
  final String description; // Add more fields as needed

  Product({required this.id, required this.name, required this.imageUrl, required this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'], // Change based on your API response
      description: json['description'] ?? '', // Handle optional fields
    );
  }
}

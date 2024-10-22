import 'package:flutter/material.dart';
import 'package:productmart/controller/productController.dart';
import 'package:productmart/model/productModel.dart';
import 'package:productmart/utils/productCard.dart';

class ProductScroller extends StatefulWidget {
  final int startKm;
  final int endKm;

  const ProductScroller({required this.startKm, required this.endKm});

  @override
  _ProductScrollerState createState() => _ProductScrollerState();
}

class _ProductScrollerState extends State<ProductScroller> {
  List<Product> _products = [];
  bool _isLoading = false;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _loadMoreProducts();
  }

  Future<void> _loadMoreProducts() async {
    if (_isLoading) return;
    // setState(() => _isLoading = true);

    try {
      final newProducts = await fetchProducts(_currentPage, widget.startKm, widget.endKm);
      setState(() {
        _currentPage++;
        _products.addAll(newProducts);
      });
    } catch (error) {
      print('Error loading products: $error');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _products.length + 1, // For loading indicator
            itemBuilder: (context, index) {
              if (index == _products.length) {
                if (!_isLoading) _loadMoreProducts();
                return Center(child: CircularProgressIndicator());
              }
              final product = _products[index];
              return ProductCard(product: product);
            },
          ),
        ),
      ],
    );
  }
}

// lib/main_screen.dart

import 'package:flutter/material.dart';
import 'package:productmart/productScreen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Scrollers')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/top_image.png'), // Your top image
            ProductScroller(startKm: 0, endKm: 10), // 0-10 km
            Image.asset('assets/middle_image.png'), // Your middle image
            ProductScroller(startKm: 10, endKm: 20), // 10-20 km
            Image.asset('assets/bottom_image.png'), // Your bottom image
            ProductScroller(startKm: 20, endKm: 100), // 20 km and above
          ],
        ),
      ),
    );
  }
}

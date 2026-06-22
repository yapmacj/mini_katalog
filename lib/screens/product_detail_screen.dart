import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/cart_manager.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartManager = CartManager();

    return Scaffold(
      appBar: AppBar(title: const Text('Ürün Detayı')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.1,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.image_not_supported, size: 60),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Açıklama',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(product.description),
                  const SizedBox(height: 4),
                  Chip(label: Text(product.category)),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton.icon(
            icon: const Icon(Icons.add_shopping_cart),
            label: const Text('Sepete Ekle'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
            ),
            onPressed: () {
              cartManager.addToCart(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${product.name} sepete eklendi')),
              );
            },
          ),
        ),
      ),
    );
  }
}

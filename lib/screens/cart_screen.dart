import 'package:flutter/material.dart';
import '../data/cart_manager.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartManager _cartManager = CartManager();

  @override
  void initState() {
    super.initState();
    _cartManager.addListener(_onChange);
  }

  @override
  void dispose() {
    _cartManager.removeListener(_onChange);
    super.dispose();
  }

  void _onChange() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final items = _cartManager.items;

    return Scaffold(
      appBar: AppBar(title: const Text('Sepet')),
      body: items.isEmpty
          ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 12),
                  Text('Sepetiniz boş', style: TextStyle(color: Colors.grey)),
                ],
              ),
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final product = items[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      product.imageUrl,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.image_not_supported),
                    ),
                  ),
                  title: Text(product.name),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () => _cartManager.removeAt(index),
                  ),
                );
              },
            ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (items.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Toplam', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        '\$${_cartManager.totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                onPressed: items.isEmpty
                    ? null
                    : () {
                        _cartManager.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Siparişiniz alındı (simülasyon)')),
                        );
                      },
                child: const Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

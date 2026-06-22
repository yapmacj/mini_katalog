import 'package:flutter/material.dart';
import '../data/products.dart';
import '../data/cart_manager.dart';
import '../models/product.dart';
import 'product_detail_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> _allProducts = getProductList();
  List<Product> _filteredProducts = [];
  final TextEditingController _searchController = TextEditingController();
  final CartManager _cartManager = CartManager();

  @override
  void initState() {
    super.initState();
    _filteredProducts = _allProducts;
    _cartManager.addListener(_onCartChanged);
  }

  @override
  void dispose() {
    _cartManager.removeListener(_onCartChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onCartChanged() {
    setState(() {});
  }

  // Basit arama ve filtreleme mantığı (Gün 4)
  void _filterProducts(String query) {
    setState(() {
      _filteredProducts = _allProducts
          .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Katalog'),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CartScreen()),
                  );
                },
              ),
              if (_cartManager.itemCount > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: CircleAvatar(
                    radius: 9,
                    backgroundColor: Colors.red,
                    child: Text(
                      '${_cartManager.itemCount}',
                      style: const TextStyle(fontSize: 11, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Arama kutusu
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Ürün ara...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: _filterProducts,
            ),
            const SizedBox(height: 12),
            // Ürün listesi
            Expanded(
              child: GridView.builder(
                itemCount: _filteredProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  final product = _filteredProducts[index];
                  return _ProductCard(product: product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;
  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {
          // Sayfalar arası veri taşıma (Route Arguments)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductDetailScreen(product: product),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.image_not_supported, size: 40),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

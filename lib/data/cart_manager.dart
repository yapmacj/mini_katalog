import 'package:flutter/material.dart';
import '../models/product.dart';

/// Eğitimin "Sepet butonu ile basit state güncelleme (simülasyon)" hedefine
/// uygun, basit ve anlaşılır bir global sepet yöneticisi.
/// (Provider/Bloc gibi ek paket kullanılmadan, sadece material.dart ile.)
class CartManager extends ChangeNotifier {
  static final CartManager _instance = CartManager._internal();
  factory CartManager() => _instance;
  CartManager._internal();

  final List<Product> _items = [];

  List<Product> get items => _items;

  int get itemCount => _items.length;

  double get totalPrice =>
      _items.fold(0.0, (sum, item) => sum + item.price);

  void addToCart(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeAt(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}

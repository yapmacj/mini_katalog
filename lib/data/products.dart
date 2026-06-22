import '../models/product.dart';

/// Gün 4'te öğretilen "JSON Yapısı (Simülasyon)" mantığına uygun olarak
/// burada gerçek bir API yerine yerel/sabit bir JSON listesi kullanılmaktadır.
/// Rapor doğrultusunda Fake Store API / DummyJSON gibi servislerle
/// kolayca değiştirilebilecek şekilde tasarlanmıştır.
final List<Map<String, dynamic>> productJsonList = [
  {
    "id": 1,
    "name": "AirPods Pro (2. Nesil)",
    "description": "Aktif gürültü engelleme özellikli kablosuz kulaklık.",
    "price": 249.0,
    "imageUrl": "https://via.placeholder.com/300x300.png?text=AirPods+Pro",
    "category": "Ses"
  },
  {
    "id": 2,
    "name": "AirPods Max",
    "description": "Üstün ses kalitesi sunan kulak üstü kablosuz kulaklık.",
    "price": 549.0,
    "imageUrl": "https://via.placeholder.com/300x300.png?text=AirPods+Max",
    "category": "Ses"
  },
  {
    "id": 3,
    "name": "HomePod",
    "description": "Derin ve net ses sunan akıllı hoparlör.",
    "price": 299.0,
    "imageUrl": "https://via.placeholder.com/300x300.png?text=HomePod",
    "category": "Ses"
  },
  {
    "id": 4,
    "name": "HomePod Mini",
    "description": "Kompakt boyutlu, şaşırtıcı derecede güçlü akıllı hoparlör.",
    "price": 99.0,
    "imageUrl": "https://via.placeholder.com/300x300.png?text=HomePod+Mini",
    "category": "Ses"
  },
  {
    "id": 5,
    "name": "iPhone 15 Pro",
    "description": "Titanyum gövdeli, güçlü işlemcili akıllı telefon.",
    "price": 999.0,
    "imageUrl": "https://via.placeholder.com/300x300.png?text=iPhone+15+Pro",
    "category": "Telefon"
  },
  {
    "id": 6,
    "name": "MacBook Pro 14\"",
    "description": "Profesyonel kullanım için yüksek performanslı dizüstü bilgisayar.",
    "price": 1599.0,
    "imageUrl": "https://via.placeholder.com/300x300.png?text=MacBook+Pro",
    "category": "Bilgisayar"
  },
  {
    "id": 7,
    "name": "iPad Air",
    "description": "Hafif, parlak ve güçlü tablet.",
    "price": 599.0,
    "imageUrl": "https://via.placeholder.com/300x300.png?text=iPad+Air",
    "category": "Tablet"
  },
];

// JSON listesinden Product nesneleri üretir (fromJson mantığı)
List<Product> getProductList() {
  return productJsonList.map((json) => Product.fromJson(json)).toList();
}

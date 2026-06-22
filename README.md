# Mini Katalog Uygulaması

Flutter Günlük Eğitimi kapsamında geliştirilen, temel mobil uygulama geliştirme becerilerini
pekiştirmeye yönelik bir ürün katalogu uygulaması.

---

## Özellikler

- Ürün listesi (GridView ile kart tabanlı tasarım)
- Ürün arama ve filtreleme
- Ürün detay sayfası
- Sepet sistemi (state simülasyonu)
- Sayfalar arası geçiş (Navigator + Route Arguments)
- JSON simülasyonundan veri okuma (fromJson / toJson)

## Ekran Yapısı

```
HomeScreen      → Ürün listesi (GridView, arama)
ProductDetail   → Ürün detayı + Sepete ekle butonu
CartScreen      → Sepet içeriği + Checkout simülasyonu
```

## Kullanılan Flutter Sürümü

```
Flutter 3.x (Dart 3.x)
```

> Projeyi klonladıktan sonra `flutter --version` komutu ile sürümünüzü kontrol edebilirsiniz.

## Kurulum ve Çalıştırma

```bash
# 1. Repoyu klonla
git clone https://github.com/KULLANICI_ADIN/mini_katalog.git
cd mini_katalog

# 2. Bağımlılıkları yükle
flutter pub get

# 3. Emülatör veya fiziksel cihazda çalıştır
flutter run
```

## Proje Klasör Yapısı

```
lib/
├── main.dart                  # Uygulama giriş noktası
├── models/
│   └── product.dart           # Ürün model sınıfı (fromJson/toJson)
├── data/
│   ├── products.dart          # JSON simülasyon verisi
│   └── cart_manager.dart      # Sepet state yönetimi
└── screens/
    ├── home_screen.dart       # Ana sayfa – GridView ürün listesi
    ├── product_detail_screen.dart  # Ürün detayı
    └── cart_screen.dart       # Sepet ekranı
```

## Ekran Görüntüleri

> `screenshots/` klasörüne ekran görüntülerini ekleyin.

## Notlar

- Ekstra Flutter paketi kullanılmamıştır (`material.dart` yeterlidir).
- Ürün verileri yerel JSON simülasyonu ile sağlanmıştır.
- İsteğe bağlı olarak [Fake Store API](https://fakestoreapi.com/products) veya
  [DummyJSON](https://dummyjson.com/products) ile entegre edilebilir.

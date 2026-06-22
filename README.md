# Mini Katalog Uygulaması

Flutter Günlük Eğitimi kapsamında geliştirilen, temel mobil uygulama geliştirme becerilerini
pekiştirmeye yönelik bir ürün katalogu uygulaması.

## Özellikler

- Ürün listesi (GridView ile kart tabanlı tasarım)
- Ürün arama ve filtreleme
- Ürün detay sayfası
- Sepet sistemi (state simülasyonu)
- Sayfalar arası geçiş (Navigator + Route Arguments)
- JSON simülasyonundan veri okuma (fromJson / toJson)

## Ekran Yapısı

HomeScreen      → Ürün listesi (GridView, arama)
ProductDetail   → Ürün detayı + Sepete ekle butonu
CartScreen      → Sepet içeriği + Checkout simülasyonu

## Kullanılan Flutter Sürümü

Flutter 3.x (Dart 3.x)

## Kurulum ve Çalıştırma

# 1. Repoyu klonla
git clone https://github.com/yapmacj/mini_katalog
cd mini_katalog

# 2. Bağımlılıkları yükle
flutter pub get

# 3. Emülatör veya fiziksel cihazda çalıştır
flutter run

# Görseller
Görseller gorseller klasörünün içinde yer almaktadır
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MiniKatalogApp());
}

class MiniKatalogApp extends StatelessWidget {
  const MiniKatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Katalog Uygulaması',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      // Named Routes (Gün 3 konusu)
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}

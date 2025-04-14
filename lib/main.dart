import 'package:flutter/material.dart';
import 'package:proj/models/shop.dart';
import 'package:proj/pages/intro_page.dart';
import 'package:proj/pages/menu_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Shop(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/menupage': (context) => const MenuPage(),
      },
    );
  }
}

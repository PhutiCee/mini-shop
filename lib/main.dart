import 'package:flutter/material.dart';
import 'package:mini_shop/model/cart_model.dart';
import 'package:mini_shop/pages/intro_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mini Shop',
        home: IntroPage(),
      ),
    );
  }
}
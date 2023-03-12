//packages import
import 'package:flutter/material.dart';
//files import
import 'categories_screen.dart';

class FoodsApp extends StatelessWidget {
  const FoodsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bem-Vindo!',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: CategoriesScreen(),
    );
  }
}

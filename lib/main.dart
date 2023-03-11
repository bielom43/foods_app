//packages import
import 'package:flutter/material.dart';

void main() => runApp(FoodsApp());

class FoodsApp extends StatelessWidget {
  const FoodsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bem-Vindo!',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Vamos Cozinhar?'),
        ),
      ),
      body: const Center(
        child: Text('Sem telas de navegação!'),
      ),
    );
  }
}

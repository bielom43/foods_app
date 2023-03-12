//packages import
import 'package:flutter/material.dart';
//files import
import '../components/category_item.dart';
import '../data/dummy_data.dart';

class FoodsApp extends StatelessWidget {
  const FoodsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bem-Vindo!',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.cyan[800],
          secondary: Colors.red,
        ),
        canvasColor: Color.fromARGB(255, 233, 210, 210),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleSmall: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      home: CategoriesScreen(),
    );
  }
}

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Vamos cozinhar!',
          style: TextStyle(
            fontFamily: 'Raleway',
          ),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: DUMMY_CATEGORIES.map((cat) {
            return CategoryItem(category: cat);
          }).toList(),
        ),
      ),
    );
  }
}

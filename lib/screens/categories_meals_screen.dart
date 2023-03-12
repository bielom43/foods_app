//packages import
import 'package:flutter/material.dart';
//files import
import '../models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              textAlign: TextAlign.start,
              category.title,
              style: TextStyle(
                fontFamily: 'Raleway',
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Receitas por categoria ${category.id}'),
      ),
    );
  }
}

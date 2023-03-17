//packages import
import 'package:flutter/material.dart';
//files import
import '../components/category_item.dart';
import '../data/dummy_data.dart';
import '../screens/categories_meals_screen.dart';
import '../utils/app_routes.dart';
import 'tabs_screen.dart';
import 'package:foods_app/screens/meal_details_screen.dart';
import 'package:foods_app/screens/settings_screen.dart';
import '../models/meal.dart';
import '../models/settings.dart';

class FoodsApp extends StatefulWidget {
  const FoodsApp({Key? key}) : super(key: key);

  @override
  State<FoodsApp> createState() => _FoodsAppState();
}

class _FoodsAppState extends State<FoodsApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bem-Vindo!',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.cyan[800],
          secondary: Colors.orange,
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
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(meals: _availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(
              onSettingsChanged: _filterMeals,
              settings: settings,
            ),
      },
    );
  }
}

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES.map((cat) {
        return CategoryItem(category: cat);
      }).toList(),
    );
  }
}

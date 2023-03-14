//packages import
import 'package:flutter/material.dart';
//files import
import 'categories_screen.dart';
import 'favorite.screen.dart';
import '../components/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  final List<Map<String, Object>> _screens = [
    {'title': 'Lista de Categorias', 'screen': CategoriesScreen()},
    {'title': 'Meus Favoritos', 'screen': FavoriteScreen()},
  ];

  _selectedScreen(int index) {
    setState(
      () {
        _selectedScreenIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              _screens[_selectedScreenIndex]['title'] as String,
              style: TextStyle(
                fontFamily: 'Raleway',
              ),
            ),
          ),
        ),
        drawer: MainDrawer(),
        body: _screens[_selectedScreenIndex]['screen'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedScreen,
          backgroundColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedScreenIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categorias',
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favoritos',
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}

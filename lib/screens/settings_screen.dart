import 'package:flutter/material.dart';

import '../components/main_drawer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (ctx, index) {
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 70,
                child: Card(
                  child: Text('$index'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

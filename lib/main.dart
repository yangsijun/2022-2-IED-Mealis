import 'package:flutter/material.dart';

import 'package:mealis/popular_menu_page.dart';
import 'package:mealis/quick_meal_page.dart';
import 'package:mealis/restaurant_page.dart';

import 'forum_page.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mealis',
      theme: ThemeData(
        colorSchemeSeed: Colors.orange,
        useMaterial3: true,
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPageIndex = 2;

  void goToPage(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.restaurant),
            label: 'Restaurant',
          ),
          NavigationDestination(
            icon: Icon(Icons.thumb_up),
            label: 'Pop Menu',
          ),
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.fastfood),
            label: 'Quick Meal',
          ),
          NavigationDestination(
            icon: Icon(Icons.forum),
            label: 'Forum',
          ),
        ],
      ),
      body: {
        0: RestaurantPage(goToPage),
        1: PopularMenuPage(goToPage),
        2: HomePage(goToPage),
        3: QuickMealPage(goToPage),
        4: ForumPage(goToPage),
      }[currentPageIndex],
    );
  }
}
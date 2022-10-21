import 'package:flutter/material.dart';
import 'package:mealis/popular_menu_page.dart';
import 'package:mealis/quick_meal_page.dart';

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
        primarySwatch: Colors.orange,
      ),
      home: const HomePage(title: 'Mealis'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _nickname = 'nickname';
  Image? _profileImage;

  void _setNickname(String nickname) {
    setState(() {
      _nickname = nickname;
    });
  }

  Text _printRestaurantName(String restaurantName) {
    return Text(restaurantName, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange));
  }

  Text _printMenuName(String menuName) {
    return Text(menuName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2D2D2D), overflow: TextOverflow.ellipsis));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 90),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 4, bottom: 16.5),
                        child: Text(
                          _nickname,
                          style: const TextStyle(fontSize: 17.5, color: Color(0xFF888888)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20, bottom: 10),
                  child: (_profileImage == null) ? const Icon(Icons.account_circle, size: 50, color: Colors.orangeAccent) : _profileImage!,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 30),
                  child: const Text(
                    'Welcome to Mealis!',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(
                        0xFF2D2D2D)),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(left: 30, right: 10, top: 30, bottom: 30),
                    height: 175,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.orangeAccent, Colors.deepOrange],
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepOrange.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PopularMenuPage()),
                          );
                        },
                        child: const Text(
                          'Today\'s Popular Menu',
                          style: TextStyle(fontSize: 27, color: Colors.white, fontWeight: FontWeight.bold, height: 1.3),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(left: 10, right: 30, top: 30, bottom: 30),
                    height: 175,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.amberAccent, Colors.orange],
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const QuickMealPage()),
                          );
                        },
                        child: const Text(
                          'Quick Meal',
                          style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold, height: 1.3),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 50, top: 20, bottom: 15),
                  child: const Text(
                    '<All Menu>',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(
                        0xFF2D2D2D)),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepOrangeAccent.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _printRestaurantName('Mix Rice'),
                              _printMenuName('Pork Cutlet Kimchi Udon'),
                              _printMenuName('Tendon'),
                              _printMenuName('Backbone Spicy Soup'),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _printRestaurantName('Handong Lounge'),
                              _printMenuName('Korean Black Noodle'),
                              _printMenuName('Nagasakki Jjampong'),
                              _printMenuName('Pork Soup'),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _printRestaurantName('Mom\'s Kitchen'),
                              _printMenuName('Samqyetang'),
                              _printMenuName('Bean Sprout Radish Beef Soup'),
                              _printMenuName('Handmade Donkatsu'),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _printRestaurantName('H.Plate'),
                              _printMenuName('Sirloin Donkatsu'),
                              _printMenuName('Spicy Donkatsu'),
                              _printMenuName('Rose Pasta'),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _printRestaurantName('Han\'s Deli'),
                              _printMenuName('Braised Chicken'),
                              _printMenuName('Braised Chicken with cheese'),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _printRestaurantName('The Grace Table'),
                              _printMenuName('Beef Curry'),
                              _printMenuName('Thai Lemon Chicken with Garlic Rice'),
                              _printMenuName('Cockle Shell Bibimbap'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Restaurant',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up),
            label: 'Pop Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Quick Meal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: 'Forum',
          )
        ],
        currentIndex: 2,
        selectedItemColor: Colors.orange,
        unselectedItemColor: const Color(0xFF888888),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),

        onTap: (index) {
          if (index == 0) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const AllRestaurentPage()),
            // );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PopularMenuPage()),
            );
          } else if (index == 2) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const HomePage(title: 'Mealis')),
            // );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QuickMealPage()),
            );
          } else if (index == 4) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const ForumPage()),
            // );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mealis/one_restaurant.dart';
import 'package:mealis/database.dart';
import 'package:mealis/my_page.dart';

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  List<String> expandedValue;
  String headerValue;
  bool isExpanded;
}

class HomePage extends StatefulWidget {
  const HomePage(this.goToPage, {Key? key}) : super(key: key);
  final void Function(int index) goToPage;

  @override
  State<HomePage> createState() => _HomePageState(goToPage);
}

class _HomePageState extends State<HomePage> {
  _HomePageState(this.goToPage);
  final void Function(int index) goToPage;

  bool isFabVisible = false;

  List<Item> data = [];

  Text _printRestaurantName(String restaurantName) {
    return Text(restaurantName, style: Theme.of(context).textTheme.headlineSmall);
  }

  Text _printMenuName(String menuName) {
    return Text(menuName, style: Theme.of(context).textTheme.bodyMedium);
  }

  List<Text> getMenuList(String restaurantName) {
    List<Text> menuList = [];
    menuList.add(_printRestaurantName(restaurantName));
    menuMap.forEach((menuName, menu) {
      if (menu.restaurantName == restaurantName) {
        menuList.add(_printMenuName(menuName));
      }
    });
    return menuList;
  }

  Widget _buildAllMenuOneRestaurant(int restaurantIndex) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OneRestaurantPage((restaurantIndex)),
              ),
            );
          },
          customBorder: RoundedRectangleBorder(
            borderRadius: (restaurantIndex == 0)
              ? (restaurantIndex == restaurantList.length - 1)
                ? const BorderRadius.all(Radius.circular(10))
                : const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
              : (restaurantIndex == restaurantList.length - 1)
                ? const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
                : const BorderRadius.all(Radius.circular(0)),
          ),
          child: Container(
            margin: (restaurantIndex == 0)
              ? (restaurantIndex == restaurantList.length - 1)
                ? const EdgeInsets.only(left: 20, top: 20, bottom: 20)
                : const EdgeInsets.only(left: 20, top: 20, bottom: 10)
              : (restaurantIndex == restaurantList.length - 1)
                ? const EdgeInsets.only(left: 20, top: 10, bottom: 20)
                : const EdgeInsets.only(left: 20, top: 10, bottom: 10),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: getMenuList(restaurantList[restaurantIndex]),
            ),
          ),
        ),
        (restaurantIndex != restaurantList.length - 1)
          ? const Divider()
          : Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Scaffold(
        body: NotificationListener<UserScrollNotification>(
          onNotification: (UserScrollNotification notification) {
            if (notification.direction == ScrollDirection.forward) {
              setState(() {
                isFabVisible = true;
              });
            } else if (notification.direction == ScrollDirection.reverse) {
              setState(() {
                isFabVisible = false;
              });
            }
            return true;
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar.large(
                backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                title: Text('Welcome to Mealis!', style: Theme.of(context).textTheme.headlineMedium),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child:
                          Card(
                            margin: const EdgeInsets.only(top: 30, left: 20, right: 10, bottom: 20),
                            child: InkWell(
                              onTap: () {
                                goToPage(1);
                              },
                              child: SizedBox(
                                width: 200,
                                height: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(0),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: <Color>[
                                            Colors.orange,
                                            Colors.deepOrangeAccent,
                                          ],
                                        ),
                                      ),
                                      child: SizedBox(
                                        width: 200,
                                        height: 150,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: const [
                                            Icon(Icons.thumb_up, size: 90, color: Color(0xFFFFB86D)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 200,
                                      height: 50,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Popular Menu',
                                            style: Theme.of(context).textTheme.titleLarge,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child:
                          Card(
                            margin: const EdgeInsets.only(top: 30, left: 10, right: 20, bottom: 20),
                            child: InkWell(
                              onTap: () {
                                goToPage(3);
                              },
                              child: SizedBox(
                                width: 200,
                                height: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(0),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: <Color>[
                                            Colors.amberAccent,
                                            Colors.orange,
                                          ],
                                        ),
                                      ),
                                      child: SizedBox(
                                        width: 200,
                                        height: 150,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: const [
                                            Icon(Icons.fastfood, size: 90, color: Color(
                                                0xFFFFDD6D)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 200,
                                      height: 50,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Quick Meal',
                                            style: Theme.of(context).textTheme.titleLarge,
                                            textAlign: TextAlign.center,
                                          ),
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
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 15),
                      child: Text(
                        'All Menu',
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 0; i < restaurantList.length; i++)
                            _buildAllMenuOneRestaurant(i),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: isFabVisible
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPage()),
                );
              },
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Icon(Icons.account_circle, color: Theme.of(context).colorScheme.onPrimaryContainer),
            )
          : null,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mealis/one_restaurant.dart';
import 'package:mealis/database.dart';
import 'package:mealis/my_page.dart';
import 'package:mealis/quick_meal_page.dart';
import 'package:mealis/popular_menu_page.dart';
import 'package:carousel_slider/carousel_slider.dart';

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

  bool isFabVisible = true;

  List<Item> data = [];

  Text _printRestaurantName(String restaurantName) {
    return Text(restaurantName,
        style:
            Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 20));
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
                    : const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))
                : (restaurantIndex == restaurantList.length - 1)
                    ? const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))
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

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    getQuickMealRanking();
    getMenuRanking();

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
                title: Text('Welcome to Mealis!',
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Flexible(
                    //       flex: 1,
                    //       child:
                    //       Card(
                    //         margin: const EdgeInsets.only(top: 30, left: 20, right: 10, bottom: 20),
                    //         child: InkWell(
                    //           onTap: () {
                    //             goToPage(1);
                    //           },
                    //           child: SizedBox(
                    //             width: 200,
                    //             height: 200,
                    //             child: Column(
                    //               mainAxisAlignment: MainAxisAlignment.start,
                    //               children: [
                    //                 Container(
                    //                   margin: const EdgeInsets.all(0),
                    //                   decoration: const BoxDecoration(
                    //                     borderRadius: BorderRadius.only(
                    //                       topLeft: Radius.circular(10),
                    //                       topRight: Radius.circular(10)
                    //                     ),
                    //                     gradient: LinearGradient(
                    //                       begin: Alignment.topCenter,
                    //                       end: Alignment.bottomCenter,
                    //                       colors: <Color>[
                    //                         Colors.orange,
                    //                         Colors.deepOrangeAccent,
                    //                       ],
                    //                     ),
                    //                   ),
                    //                   child: SizedBox(
                    //                     width: 200,
                    //                     height: 150,
                    //                     child: Column(
                    //                       mainAxisAlignment: MainAxisAlignment.center,
                    //                       children: const [
                    //                         Icon(Icons.thumb_up, size: 90, color: Color(0xFFFFB86D)),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 SizedBox(
                    //                   width: 200,
                    //                   height: 50,
                    //                   child: Column(
                    //                     mainAxisAlignment: MainAxisAlignment.center,
                    //                     children: [
                    //                       Text(
                    //                         'Popular Menu',
                    //                         style: Theme.of(context).textTheme.titleLarge,
                    //                         textAlign: TextAlign.center,
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     Flexible(
                    //       flex: 1,
                    //       child:
                    //       Card(
                    //         margin: const EdgeInsets.only(top: 30, left: 10, right: 20, bottom: 20),
                    //         child: InkWell(
                    //           onTap: () {
                    //             goToPage(3);
                    //           },
                    //           child: SizedBox(
                    //             width: 200,
                    //             height: 200,
                    //             child: Column(
                    //               mainAxisAlignment: MainAxisAlignment.start,
                    //               children: [
                    //                 Container(
                    //                   margin: const EdgeInsets.all(0),
                    //                   decoration: const BoxDecoration(
                    //                     borderRadius: BorderRadius.only(
                    //                         topLeft: Radius.circular(10),
                    //                         topRight: Radius.circular(10)
                    //                     ),
                    //                     gradient: LinearGradient(
                    //                       begin: Alignment.topCenter,
                    //                       end: Alignment.bottomCenter,
                    //                       colors: <Color>[
                    //                         Colors.amberAccent,
                    //                         Colors.orange,
                    //                       ],
                    //                     ),
                    //                   ),
                    //                   child: SizedBox(
                    //                     width: 200,
                    //                     height: 150,
                    //                     child: Column(
                    //                       mainAxisAlignment: MainAxisAlignment.center,
                    //                       children: const [
                    //                         Icon(Icons.fastfood, size: 90, color: Color(
                    //                             0xFFFFDD6D)),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 SizedBox(
                    //                   width: 200,
                    //                   height: 50,
                    //                   child: Column(
                    //                     mainAxisAlignment: MainAxisAlignment.center,
                    //                     children: [
                    //                       Text(
                    //                         'Quick Meal',
                    //                         style: Theme.of(context).textTheme.titleLarge,
                    //                         textAlign: TextAlign.center,
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Quick Meal
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 0),
                      child: Text(
                        'Quick Meal',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    CarouselSlider(
                      carouselController: _controller,
                      options: CarouselOptions(
                        height: 160.0,
                        viewportFraction: 0.9,
                        initialPage: 0,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      items: [0, 1, 2, 3, 4, -1].map((i) {
                        return Builder(builder: (BuildContext context) {
                          if (i >= 0) {
                            return Container(
                              padding: const EdgeInsets.all(5),
                              child: buildQuickMealCard(
                                  context, quickMealRankingList[i].key, i + 1),
                            );
                          } else {
                            return SizedBox(
                              width: double.infinity,
                              child: IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 5,
                                            right: 5,
                                            top: 5,
                                            bottom: 5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .surfaceVariant,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              goToPage(3);
                                            },
                                            customBorder:
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: SizedBox(
                                              width: 300,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.add_circle_outline,
                                                      size: 50,
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                  Text(
                                                    'See More',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        });
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          [0, 1, 2, 3, 4, -1].asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            child: Icon(
                              (entry.key != 5) ? Icons.circle : Icons.add,
                              size: 12,
                              color: (Theme.of(context).colorScheme.primary)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    // Popular Menu
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 0),
                      child: Text(
                        'Today\'s Popular Menu',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    CarouselSlider(
                      carouselController: _controller,
                      options: CarouselOptions(
                          height: 190.0,
                          viewportFraction: 0.9,
                          initialPage: 0,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                      items: [0, 1, 2, 3, 4, -1].map((i) {
                        return Builder(builder: (BuildContext context) {
                          if (i >= 0) {
                            return Container(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, top: 5, bottom: 5),
                              child: buildPopularMenuCard(context, setState,
                                  menuRankingList[i].key, i + 1),
                            );
                          } else {
                            return SizedBox(
                              width: double.infinity,
                              child: IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 5,
                                            right: 5,
                                            top: 5,
                                            bottom: 5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .surfaceVariant,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              goToPage(1);
                                            },
                                            customBorder:
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: SizedBox(
                                              width: 300,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.add_circle_outline,
                                                      size: 50,
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                  Text(
                                                    'See More',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        });
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          [0, 1, 2, 3, 4, -1].asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            child: Icon(
                              (entry.key != 5) ? Icons.circle : Icons.add,
                              size: 12,
                              color: (Theme.of(context).colorScheme.primary)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 15),
                      child: Text(
                        'All Menu',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 30),
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
                child: Icon(Icons.account_circle,
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              )
            : null,
      ),
    );
  }
}

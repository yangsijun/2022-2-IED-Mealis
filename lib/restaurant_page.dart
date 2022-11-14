import 'package:flutter/material.dart';
import 'package:mealis/database.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

import 'one_restaurant.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage(this.goToPage, {Key? key}) : super(key: key);
  final void Function(int index) goToPage;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState(goToPage);
}

int favoriteRestaurantNum = 0;

void getFavoriteRestaurantNum() {
  favoriteRestaurantNum = 0;
  for (final restaurantInfo in restaurantInfoMap.values) {
    if (restaurantInfo.isFavorite) {
      favoriteRestaurantNum++;
    }
  }
}

class _RestaurantPageState extends State<RestaurantPage> {
  _RestaurantPageState(this.goToPage);
  final void Function(int index) goToPage;

  @override
  Widget build(BuildContext context) {
    getFavoriteRestaurantNum();

    return Center(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar.medium(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  goToPage(2);
                },
              ),
              title: const Text('Restaurant'),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Column(
                    children: [
                      ReorderableGridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 1.0,
                        children: restaurantList
                            .map((String restaurantName) => Card(
                                  key: ValueKey(restaurantName),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              OneRestaurantPage(restaurantList
                                                  .indexOf(restaurantName)),
                                        ),
                                      );
                                    },
                                    customBorder: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Stack(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  top: 0, right: 0),
                                              child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    restaurantInfoMap[
                                                                restaurantName]!
                                                            .isFavorite =
                                                        !restaurantInfoMap[
                                                                restaurantName]!
                                                            .isFavorite;
                                                    if (restaurantInfoMap[
                                                            restaurantName]!
                                                        .isFavorite) {
                                                      favoriteRestaurantNum++;
                                                      String temp = restaurantList
                                                          .removeAt(restaurantList
                                                              .indexOf(
                                                                  restaurantName));
                                                      restaurantList.insert(
                                                          favoriteRestaurantNum -
                                                              1,
                                                          temp);
                                                    } else {
                                                      favoriteRestaurantNum--;
                                                      String temp = restaurantList
                                                          .removeAt(restaurantList
                                                              .indexOf(
                                                                  restaurantName));
                                                      restaurantList.insert(
                                                          favoriteRestaurantNum,
                                                          temp);
                                                    }
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.favorite,
                                                  color: (restaurantInfoMap[
                                                              restaurantName]!
                                                          .isFavorite)
                                                      ? Colors.redAccent
                                                      : Colors.grey,
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Center(
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            child: (restaurantInfoMap[
                                                        restaurantName]!
                                                    .isAvailable)
                                                ? Text(restaurantName,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge,
                                                    textAlign: TextAlign.center)
                                                : Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(restaurantName,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .titleLarge!
                                                              .copyWith(
                                                                  color: Colors
                                                                      .grey,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough),
                                                          textAlign:
                                                              TextAlign.center),
                                                      Text(' (Unavailable)',
                                                          style: Theme
                                                                  .of(context)
                                                              .textTheme
                                                              .titleLarge
                                                              ?.copyWith(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .redAccent),
                                                          overflow:
                                                              TextOverflow.fade,
                                                          softWrap: false),
                                                    ],
                                                  ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                        onReorder: (int oldIndex, int newIndex) {
                          setState(() {
                            if (restaurantInfoMap[restaurantList[oldIndex]]!
                                .isFavorite) {
                              if (restaurantInfoMap[restaurantList[newIndex]]!
                                  .isFavorite) {
                                final String item =
                                    restaurantList.removeAt(oldIndex);
                                restaurantList.insert(newIndex, item);
                              } else {
                                final String item =
                                    restaurantList.removeAt(oldIndex);
                                restaurantList.insert(
                                    favoriteRestaurantNum - 1, item);
                              }
                            } else {
                              if (restaurantInfoMap[restaurantList[newIndex]]!
                                  .isFavorite) {
                                final String item =
                                    restaurantList.removeAt(oldIndex);
                                restaurantList.insert(
                                    favoriteRestaurantNum, item);
                              } else {
                                final String item =
                                    restaurantList.removeAt(oldIndex);
                                restaurantList.insert(newIndex, item);
                              }
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

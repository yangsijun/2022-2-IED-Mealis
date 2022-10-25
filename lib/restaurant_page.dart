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

class _RestaurantPageState extends State<RestaurantPage> {
  _RestaurantPageState(this.goToPage);
  final void Function(int index) goToPage;

  @override
  Widget build(BuildContext context) {
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
                                    child: Center(
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(restaurantName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                            textAlign: TextAlign.center),
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                        onReorder: (int oldIndex, int newIndex) {
                          setState(() {
                            String temp = restaurantList.removeAt(oldIndex);
                            restaurantList.insert(newIndex, temp);
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

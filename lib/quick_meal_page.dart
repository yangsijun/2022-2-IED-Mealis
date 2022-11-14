import 'package:flutter/material.dart';
import 'package:mealis/one_restaurant.dart';
import 'package:mealis/database.dart';

class QuickMealPage extends StatefulWidget {
  const QuickMealPage(this.goToPage, {Key? key}) : super(key: key);
  final void Function(int index) goToPage;

  @override
  State<QuickMealPage> createState() => _QuickMealPageState(goToPage);
}

List<MapEntry<String, RestaurantInfo>> quickMealRankingList = [];

void getQuickMealRanking() {
  quickMealRankingList = restaurantInfoMap.entries.toList();
  quickMealRankingList.sort((a, b) {
    if (a.value.isAvailable && b.value.isAvailable) {
      return a.value.waitingTime.compareTo(b.value.waitingTime);
    } else if (a.value.isAvailable) {
      return -1;
    } else if (b.value.isAvailable) {
      return 1;
    } else {
      return 0;
    }
  });
}

int showQuickMealNum = 10;

Column _buildRestaurantTileContent(BuildContext context, String restaurantName, int rank) {
  return Column(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      ListTile(
        title: (restaurantInfoMap[restaurantName]!.isAvailable)
          ? Text('$rank. $restaurantName', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20), overflow: TextOverflow.fade, softWrap: false,)
          : Row(
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 270),
                  child: Text('$rank. $restaurantName', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20, color: Colors.grey, decoration: TextDecoration.lineThrough), overflow: TextOverflow.fade, softWrap: false,),
                ),
                Expanded(
                  child: Text(' (Unavailable)', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20, color: Colors.redAccent), overflow: TextOverflow.fade, softWrap: false),
                ),
              ],
            ),
      ),
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: double.infinity, maxHeight: 75, minWidth: 300, minHeight: 75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Now Waiting', style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center),
                const SizedBox(height: 5),
                Icon(
                  (!restaurantInfoMap[restaurantName]!.isAvailable)
                      ? Icons.no_meals
                      : (restaurantInfoMap[restaurantName]!.waitingPeople > 30)
                      ? Icons.groups
                      : (restaurantInfoMap[restaurantName]!.waitingPeople > 10)
                      ? Icons.group
                      : Icons.person,
                  color: Colors.grey,
                  size: 40,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Waiting Time', style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center),
                (restaurantInfoMap[restaurantName]!.isAvailable)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(restaurantInfoMap[restaurantName]!.waitingTime.toString(), style: Theme.of(context).textTheme.displaySmall),
                      Text((restaurantInfoMap[restaurantName]!.waitingTime > 1) ? ' minutes' : ' minute', style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  )
                : Column(
                  children: [
                    const SizedBox(height: 15),
                    Text('Not Available', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.redAccent)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(height: 10,)
    ],
  );
}

Widget buildQuickMealCard(BuildContext context, String restaurantName, int rank) {
  return Card(
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OneRestaurantPage(restaurantList.indexOf(restaurantName)),
          ),
        );
      },
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        child: _buildRestaurantTileContent(context, restaurantName, rank),
      ),
    ),
  );
}

class _QuickMealPageState extends State<QuickMealPage> {
  _QuickMealPageState(this.goToPage);
  final void Function(int index) goToPage;

  @override
  Widget build(BuildContext context) {
    getQuickMealRanking();
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
              title: const Text('Quick Meal'),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < showQuickMealNum; i++)
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                        child: buildQuickMealCard(context, quickMealRankingList[i].key, i + 1),
                      ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                          foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                        ),
                        onPressed: () {
                          if (showQuickMealNum < quickMealRankingList.length) {
                            setState(() {
                              showQuickMealNum += 3;
                              if (showQuickMealNum > quickMealRankingList.length) {
                                showQuickMealNum = quickMealRankingList.length;
                              }
                            });
                          } else {
                            setState(() {
                              showQuickMealNum = 3;
                            });
                          }
                        },
                        child: Text((showQuickMealNum < quickMealRankingList.length) ? 'See More' : 'Show less'),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
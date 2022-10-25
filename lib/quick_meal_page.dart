import 'package:flutter/material.dart';
import 'package:mealis/one_restaurant.dart';
import 'package:mealis/database.dart';

class QuickMealPage extends StatefulWidget {
  const QuickMealPage(this.goToPage, {Key? key}) : super(key: key);
  final void Function(int index) goToPage;

  @override
  State<QuickMealPage> createState() => _QuickMealPageState(goToPage);
}

class _QuickMealPageState extends State<QuickMealPage> {
  _QuickMealPageState(this.goToPage);
  final void Function(int index) goToPage;

  Widget _buildQuickMealCard(String restaurantName, int rank) {
    return Card(
      margin: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OneRestaurantPage(restaurantList.indexOf(restaurantName)),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Text('$rank', style: (rank < 10) ? Theme.of(context).textTheme.displayMedium : Theme.of(context).textTheme.displaySmall, textAlign: TextAlign.center),
                ),
              ),
              const VerticalDivider(),
              Flexible(
                flex: 4,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(restaurantName, style: Theme.of(context).textTheme.headlineSmall),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Now Waiting', style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(restaurantInfoMap[restaurantName]!.waitingPeople.toString(), style: Theme.of(context).textTheme.displaySmall),
                                    Text((restaurantInfoMap[restaurantName]!.waitingPeople > 1) ? ' people' : ' person', style: Theme.of(context).textTheme.bodyLarge),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(width: 30),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Waiting Time', style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(restaurantInfoMap[restaurantName]!.waitingTime.toString(), style: Theme.of(context).textTheme.displaySmall),
                                    Text((restaurantInfoMap[restaurantName]!.waitingTime > 1) ? ' minutes' : ' minute', style: Theme.of(context).textTheme.bodyLarge),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<MapEntry<String, RestaurantInfo>> quickMealRankingList = [];

  void getQuickMealRanking() {
    quickMealRankingList = restaurantInfoMap.entries.toList();
    quickMealRankingList.sort((a, b) => a.value.waitingTime.compareTo(b.value.waitingTime));
  }

  int showQuickMealNum = 3;

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
                      _buildQuickMealCard(quickMealRankingList[i].key, i + 1),
                    TextButton(
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
                      child: Text((showQuickMealNum < quickMealRankingList.length) ? 'See More' : 'Show less', style: TextStyle(color: Theme.of(context).colorScheme.primary, decoration: TextDecoration.underline)),
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
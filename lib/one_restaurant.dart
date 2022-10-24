import 'package:flutter/material.dart';

import 'database.dart';
import 'menu.dart';
import 'one_menu_page.dart';

class OneRestaurantPage extends StatefulWidget {
  const OneRestaurantPage(this.restaurantIndex, {Key? key}) : super(key: key);
  final int restaurantIndex;

  @override
  State<OneRestaurantPage> createState() => _OneRestaurantPageState(restaurantIndex);
}


class _OneRestaurantPageState extends State<OneRestaurantPage>{
  _OneRestaurantPageState(this.restaurantIndex);
  final int restaurantIndex;

  List<Widget> _buildMenuCards(int restaurantIndex) {
    List<Widget> menuCards = [];
    for (Menu menu in menuMap.values) {
      if (menu.restaurantName == restaurantList[restaurantIndex]) {
        menuCards.add(
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OneMenuPage(menu.menuName),
                  ),
                );
              },
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 17,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image.asset(
                          menu.image,
                          fit: BoxFit.fill,
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            return const Image(
                              image: AssetImage('assets/images/no_image.jpg'),
                              fit: BoxFit.fill,
                            );
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(menu.menuName, style: Theme.of(context).textTheme.bodyLarge, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }
    return menuCards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(restaurantList[restaurantIndex]),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: [
                  Card(
                    margin: const EdgeInsets.all(25),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text('Operating Time', style: Theme.of(context).textTheme.headlineMedium),
                                const SizedBox(height: 10),
                                Column(
                                  children: restaurantInfoMap[restaurantList[restaurantIndex]]!.operatingTimeTextList.map((String operatingTimeText) => Text(operatingTimeText, style: Theme.of(context).textTheme.bodyMedium)).toList(),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Now Waiting', style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text(restaurantInfoMap[restaurantList[restaurantIndex]]!.waitingPeople.toString(), style: Theme.of(context).textTheme.displayLarge),
                                        Text((restaurantInfoMap[restaurantList[restaurantIndex]]!.waitingPeople > 1) ? ' people' : ' person', style: Theme.of(context).textTheme.bodyLarge),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Waiting Time', style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text(restaurantInfoMap[restaurantList[restaurantIndex]]!.waitingTime.toString(), style: Theme.of(context).textTheme.displayLarge),
                                        Text((restaurantInfoMap[restaurantList[restaurantIndex]]!.waitingTime > 1) ? ' minutes' : ' minute', style: Theme.of(context).textTheme.bodyLarge),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 10),
                      Text('Menu', style: Theme.of(context).textTheme.headlineMedium),
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: 1 / 1.25,
                          children: _buildMenuCards(restaurantIndex),
                        ),
                        // child: Column(
                        //   children: _buildMenuCards(restaurantIndex),
                        // ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


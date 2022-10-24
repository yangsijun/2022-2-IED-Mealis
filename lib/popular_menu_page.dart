import 'package:flutter/material.dart';
import 'package:mealis/database.dart';
import 'package:mealis/popular_menu_page.dart';
import 'package:mealis/quick_meal_page.dart';

import 'comment.dart';
import 'menu.dart';

class PopularMenuPage extends StatefulWidget {
  const PopularMenuPage(this.goToPage, {Key? key}) : super(key: key);
  final void Function(int index) goToPage;

  @override
  State<PopularMenuPage> createState() => _PopularMenuPageState(goToPage);
}

class _PopularMenuPageState extends State<PopularMenuPage> {
  _PopularMenuPageState(this.goToPage);
  final void Function(int index) goToPage;

  Column _buildMenuCardContent(String menuName) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(menuName, style: Theme.of(context).textTheme.titleLarge, overflow: TextOverflow.ellipsis,),
          subtitle: Text(menuMap[menuName]!.restaurantName),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            ActionChip(
              avatar: const Icon(Icons.comment),
              label: Text(menuMap[menuName]!.stat.comment.toString(), style: Theme.of(context).textTheme.labelLarge),
              onPressed: () {

              },
            ),
            ActionChip(
              avatar: const Icon(Icons.thumb_up),
              label: Text(menuMap[menuName]!.stat.like.toString(), style: Theme.of(context).textTheme.labelLarge),
              onPressed: () {

              },
            ),
            ActionChip(
              avatar: const Icon(Icons.thumb_down),
              label: Text(menuMap[menuName]!.stat.dislike.toString(), style: Theme.of(context).textTheme.labelLarge),
              onPressed: () {

              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPopularMenuCard(String menuName, int rank) {
    return SizedBox(
      width: double.infinity,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 15, right: 10),
                          child: Text('$rank', style: (rank < 10) ? Theme.of(context).textTheme.displayMedium : Theme.of(context).textTheme.displaySmall, textAlign: TextAlign.center),
                        ),
                      ),
                      const VerticalDivider(),
                      Flexible(
                        flex: 4,
                        child: Container(
                          child: _buildMenuCardContent(menuName),
                        ),
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

  Widget _buildRealTimeComments(int index) {
    return Column(
            children: [
              InkWell(
                onTap: () {

                },
                customBorder: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                ),
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            color: Theme.of(context).colorScheme.secondaryContainer,
                          ),
                          child: Text(realTimeCommentList[index].menuName, style: Theme.of(context).textTheme.labelLarge, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Flexible(
                        flex: 3,
                        child: Text(realTimeCommentList[index].commentText, style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
              ),
              (index != showRealTimeCommentNum - 1) ? const Divider() : Container(),
            ],
    );
  }

  List<MapEntry<String, Menu>> menuRankingList = [];

  void getMenuRanking() {
    menuRankingList = menuMap.entries.toList();
    menuRankingList.sort((a, b) => (a.value.stat.like - a.value.stat.dislike).compareTo((b.value.stat.like - b.value.stat.dislike)));
  }

  int showPopularMenuNum = 3;
  int showRealTimeCommentNum = 5;

  @override
  Widget build(BuildContext context) {
    getMenuRanking();
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
              title: const Text('Today\'s Popular Menu'),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < showPopularMenuNum; i++)
                      _buildPopularMenuCard(menuRankingList[i].key, i + 1),
                    TextButton(
                      onPressed: () {
                        if (showPopularMenuNum < menuRankingList.length) {
                          setState(() {
                            showPopularMenuNum += 3;
                            if (showPopularMenuNum > menuRankingList.length) {
                              showPopularMenuNum = menuRankingList.length;
                            }
                          });
                        } else {
                          setState(() {
                            showPopularMenuNum = 3;
                          });
                        }
                      },
                      child: Text((showPopularMenuNum < menuRankingList.length) ? 'See More' : 'Show less', style: Theme.of(context).textTheme.labelLarge),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30, bottom: 15),
                      child: Text(
                        'Real-time Comments',
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          for (int i = 0; i < showRealTimeCommentNum; i++)
                            _buildRealTimeComments(i),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (showRealTimeCommentNum < realTimeCommentList.length) {
                          setState(() {
                            showRealTimeCommentNum += 3;
                            if (showRealTimeCommentNum > realTimeCommentList.length) {
                              showRealTimeCommentNum = realTimeCommentList.length;
                            }
                          });
                        } else {
                          setState(() {
                            showRealTimeCommentNum = 5;
                          });
                        }
                      },
                      child: Text((showRealTimeCommentNum < realTimeCommentList.length) ? 'See More' : 'Show less', style: Theme.of(context).textTheme.labelLarge),
                    ),
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
import 'package:flutter/material.dart';
import 'package:mealis/database.dart';
import 'package:mealis/menu.dart';
import 'package:mealis/one_menu_page.dart';

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
          title: Text(menuName, style: Theme.of(context).textTheme.titleLarge, overflow: TextOverflow.ellipsis),
          subtitle: Text(menuMap[menuName]!.restaurantName),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            ActionChip(
              avatar: Icon(Icons.comment, color: (myEvalMap[menuName]!.isCommented) ? Colors.orangeAccent : Theme.of(context).chipTheme.surfaceTintColor),
              label: Text(menuMap[menuName]!.stat.comment.toString(), style: TextStyle(color: (myEvalMap[menuName]!.isCommented) ? Colors.orangeAccent : Theme.of(context).chipTheme.surfaceTintColor, fontSize: 14)),
              onPressed: () {
                commentDialog(context, menuName).then((value) => setState(() {}));
              },
            ),
            ActionChip(
              avatar: Icon(Icons.thumb_up, color: (myEvalMap[menuName]!.isLiked) ? Colors.redAccent : Theme.of(context).chipTheme.surfaceTintColor),
              label: Text(menuMap[menuName]!.stat.like.toString(), style: TextStyle(color: (myEvalMap[menuName]!.isLiked) ? Colors.redAccent : Theme.of(context).chipTheme.surfaceTintColor, fontSize: 14)),
              onPressed: () {
                setState(() {
                  if (myEvalMap[menuName]!.isLiked) {
                    menuMap[menuName]!.stat.like--;
                    myEvalMap[menuName]!.isLiked = false;
                  } else {
                    if (myEvalMap[menuName]!.isDisliked) {
                      menuMap[menuName]!.stat.dislike--;
                      myEvalMap[menuName]!.isDisliked = false;
                    }
                    menuMap[menuName]!.stat.like++;
                    myEvalMap[menuName]!.isLiked = true;
                  }
                });
              },
            ),
            ActionChip(
              avatar: Icon(Icons.thumb_down, color: (myEvalMap[menuName]!.isDisliked) ? Colors.blueAccent : Theme.of(context).chipTheme.surfaceTintColor),
              label: Text(menuMap[menuName]!.stat.dislike.toString(), style: TextStyle(color: (myEvalMap[menuName]!.isDisliked) ? Colors.blueAccent : Theme.of(context).chipTheme.surfaceTintColor, fontSize: 14)),
              onPressed: () {
                setState(() {
                  if (myEvalMap[menuName]!.isDisliked) {
                    menuMap[menuName]!.stat.dislike--;
                    myEvalMap[menuName]!.isDisliked = false;
                  } else {
                    if (myEvalMap[menuName]!.isLiked) {
                      menuMap[menuName]!.stat.like--;
                      myEvalMap[menuName]!.isLiked = false;
                    }
                    menuMap[menuName]!.stat.dislike++;
                    myEvalMap[menuName]!.isDisliked = true;
                  }
                });
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
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OneMenuPage(menuName)),
                      ).then((value) => setState(() {}));
                    },
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: SizedBox(
                            width: double.infinity,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('$rank', style: (rank < 10) ? Theme.of(context).textTheme.displayMedium : Theme.of(context).textTheme.displaySmall, textAlign: TextAlign.center),
                                ],
                            ),
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OneMenuPage(commentList[index].menuName)),
            ).then((value) => setState(() {}));
          },
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
                    child: Text(commentList[index].menuName, style: Theme.of(context).textTheme.labelLarge, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,),
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  flex: 3,
                  child: Text(commentList[index].commentText, style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis),
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
    menuRankingList.sort((a, b) => (b.value.stat.like - b.value.stat.dislike).compareTo((a.value.stat.like - a.value.stat.dislike)));
  }

  int showPopularMenuNum = 3;
  int showRealTimeCommentNum = 10;

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
                      child: Text((showPopularMenuNum < menuRankingList.length) ? 'See More' : 'Show less', style: TextStyle(color: Theme.of(context).colorScheme.primary, decoration: TextDecoration.underline)),
                    ),
                    const Divider(),
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 15),
                      child: Text(
                        'Real-time Comments',
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                      child: SizedBox(
                        height: 200,
                        child: SingleChildScrollView(
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
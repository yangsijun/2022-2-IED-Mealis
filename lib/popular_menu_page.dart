import 'package:flutter/material.dart';
import 'package:mealis/database.dart';
import 'package:mealis/popular_menu_page.dart';
import 'package:mealis/quick_meal_page.dart';

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
          title: Text(menuName, style: Theme.of(context).textTheme.titleLarge),
          subtitle: Text(menuMap[menuName]!.restaurantName),
        ),
        ButtonBar(
          children: <Widget>[
            ActionChip(
              avatar: const Icon(Icons.comment),
              label: Text(menuMap[menuName]!.stat.comment.toString(), style: Theme.of(context).textTheme.labelLarge),
              onPressed: () {
                goToPage(3);
              },
            ),
            ActionChip(
              avatar: const Icon(Icons.thumb_up),
              label: Text(menuMap[menuName]!.stat.like.toString(), style: Theme.of(context).textTheme.labelLarge),
              onPressed: () {
                goToPage(3);
              },
            ),
            ActionChip(
              avatar: const Icon(Icons.thumb_down),
              label: Text(menuMap[menuName]!.stat.dislike.toString(), style: Theme.of(context).textTheme.labelLarge),
              onPressed: () {
                goToPage(3);
              },
            ),
          ],
        ),
      ],
    );
  }

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
              title: const Text('Today\'s Popular Menu'),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
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
                                      Container(
                                        padding: const EdgeInsets.only(left: 15, right: 10),
                                        child: Text('1', style: Theme.of(context).textTheme.displayLarge, textAlign: TextAlign.center, overflow: TextOverflow.fade,),
                                      ),
                                      const VerticalDivider(),
                                      Flexible(
                                        child: Container(
                                          child: _buildMenuCardContent('Pork Cutlet Kimchi Udon'),
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
                    ),

                    SizedBox(
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
                                      Container(
                                        padding: const EdgeInsets.only(left: 15, right: 10),
                                        child: Text('2', style: Theme.of(context).textTheme.displayLarge, textAlign: TextAlign.center, overflow: TextOverflow.fade,),
                                      ),
                                      const VerticalDivider(),
                                      Flexible(
                                        child: Container(
                                          child: _buildMenuCardContent('Samgyetang'),
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
                    ),

                    SizedBox(
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
                                      Container(
                                        padding: const EdgeInsets.only(left: 15, right: 10),
                                        child: Text('3', style: Theme.of(context).textTheme.displayLarge, textAlign: TextAlign.center, overflow: TextOverflow.fade,),
                                      ),
                                      const VerticalDivider(),
                                      Flexible(
                                        child: Container(
                                          child: _buildMenuCardContent('Rose Pasta'),
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
                      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {

                            },
                            customBorder: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                            ),
                            child: Container(
                              margin: const EdgeInsets.only(left: 20, top: 10, bottom: 0),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 2,
                                    child: ActionChip(
                                      onPressed: () {

                                      },
                                      label: Text('Pork Cutlet Kimchi Udon', overflow: TextOverflow.ellipsis)
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Flexible(
                                    flex: 3,
                                    child: Text('JMT', style: Theme.of(context).textTheme.bodyMedium),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(),
                        ],
                      ),
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
import 'package:flutter/material.dart';
import 'comment.dart';
import 'database.dart';
import 'menu.dart';


class OneMenuPage extends StatefulWidget {
  const OneMenuPage(this.menuName, {Key? key}) : super(key: key);
  final String menuName;

  @override
  State<OneMenuPage> createState() => _OneMenuPageState(menuName);
}

class _OneMenuPageState extends State<OneMenuPage>{
  _OneMenuPageState(this.menuName);
  final String menuName;

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

  List<Widget> _buildMenuCards(String menuName) {
    List<Widget> menuCards = [];
    for (Menu menu in menuMap.values) {
      if (menu.menuName == menuName) {
        menuCards.add(
          Card(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
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
                  Container(
                    child: _buildMenuCardContent(menu.menuName),
                  ),
                ],
              ),
            ),
          ),
        );
        break;
      }
    }
    return menuCards;
  }

  List<Widget> _getMenuComments(String menuName) {
    List<Widget> menuComments = [];
    for (MenuComment comment in commentList) {
      if (comment.menuName == menuName) {
        if (menuComments.isEmpty) {
          menuComments.add(const SizedBox(height: 10));
        }
        menuComments.add(
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(comment.commentText, style: Theme.of(context).textTheme.bodyLarge, overflow: TextOverflow.ellipsis),
          ),
        );
        menuComments.add(const Divider());
      }
    }
    return menuComments;
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
            title: Text(menuName),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: _buildMenuCards(menuName),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Comments', style: Theme.of(context).textTheme.titleLarge),
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  commentDialog(context, menuName).then((value) => setState(() {}));
                                },
                              ),
                            ],
                          ),
                        ),
                        Card(
                          child: SizedBox(
                            width: double.infinity,
                            height: 200,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: _getMenuComments(menuName),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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

final commentController = TextEditingController();

Future<void> commentDialog(BuildContext context, String menuName) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        child: Scaffold(
          appBar: AppBar(
            title: Text(menuName),
            centerTitle: false,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  if (commentController.text.isNotEmpty) {
                    commentList.insert(0, MenuComment(menuName, commentController.text));
                    myEvalMap[menuName]!.isCommented = true;
                    commentController.clear();
                  }
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          ),
          body: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: commentController,
                    focusNode: FocusNode(),
                    autofocus: true,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Comment',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
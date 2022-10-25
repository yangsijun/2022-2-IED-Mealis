import 'package:flutter/material.dart';
import 'package:mealis/database.dart';
import 'package:mealis/main.dart';

class OneAnnouncementPage extends StatefulWidget {
  const OneAnnouncementPage(this.announcementIndex, {Key? key}) : super(key: key);
  final int announcementIndex;

  @override
  State<OneAnnouncementPage> createState() => _OneAnnouncementPageState(announcementIndex);
}

class _OneAnnouncementPageState extends State<OneAnnouncementPage> {
  _OneAnnouncementPageState(this.announcementIndex);
  final int announcementIndex;

  final postCommentController = TextEditingController();

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
            title: Text(announcementPostList[announcementIndex].title),
          ),
          SliverToBoxAdapter(
            child: Container(
                margin: const EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('Writer: '),
                          Text(announcementPostList[announcementIndex].writer, style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('Date: '),
                          Text(announcementPostList[announcementIndex].date.toString(), style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(10),
                      constraints: const BoxConstraints(minHeight: 200),
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(announcementPostList[announcementIndex].content, style: Theme.of(context).textTheme.bodyLarge),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 20),
                    Text('Comments', style: Theme.of(context).textTheme.headlineSmall),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 10),
                              Flexible(
                                flex: 10,
                                child: TextField(
                                  controller: postCommentController,
                                  maxLines: 1,
                                  decoration: const InputDecoration(
                                    hintText: 'Write a comment',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                flex: 1,
                                child: IconButton(
                                  onPressed: () {
                                    if (postCommentController.text.isNotEmpty) {
                                      postCommentList.insert(0, PostComment(0, announcementIndex, nickname, DateTime.now(), postCommentController.text));
                                      postCommentController.clear();
                                    }
                                    //keyboard hide
                                    FocusScope.of(context).unfocus();
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.send),
                                ),
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ),
                        for (int i = 0; i < postCommentList.length; i++)
                          if (postCommentList[i].postType == 0 && postCommentList[i].postIndex == announcementIndex)
                            ListTile(
                              title: Text(postCommentList[i].commentText),
                              subtitle: Text(postCommentList[i].commentWriter),
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
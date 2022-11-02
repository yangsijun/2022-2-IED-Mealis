import 'package:flutter/material.dart';

import 'package:mealis/database.dart';
import 'package:mealis/one_student_voice_page.dart';

class MyPostsPage extends StatefulWidget {
  const MyPostsPage({Key? key}) : super(key: key);

  @override
  State<MyPostsPage> createState() => _MyPostsPageState();
}


class _MyPostsPageState extends State<MyPostsPage> {
  int _myPostsNum = 0;

  List<Widget> getMyPostsList(BuildContext context) {
    List<Widget> myPostsList = [];
    for (int i = 0; i < studentVoicePostList.length; i++) {
      if (studentVoicePostList[i].writer == myUser.nickname) {
        _myPostsNum++;
        myPostsList.add(
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            color: Theme.of(context).colorScheme.surface,
            child: Column(
              children: [
                Column(
                  children: [
                    ListTile(
                      // leading: const Icon(Icons.restaurant),
                      title: Text(studentVoicePostList[i].title),
                      subtitle: Text(studentVoicePostList[i].writer),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OneStudentVoicePage(i),
                          ),
                        ).then((value) => setState(() {}));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    }
    return myPostsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text('My Posts'),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: (_myPostsNum > 0)
                  ? getMyPostsList(context)
                  : [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: const Text('No posts yet'),
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
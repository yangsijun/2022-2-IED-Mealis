import 'package:flutter/material.dart';

import 'package:mealis/database.dart';
import 'package:mealis/one_student_voice_page.dart';

class MyPostsPage extends StatefulWidget {
  const MyPostsPage({Key? key}) : super(key: key);

  @override
  State<MyPostsPage> createState() => _MyPostsPageState();
}

class _MyPostsPageState extends State<MyPostsPage> {
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
                children: [
                  for(int i = 0; i < studentVoicePostList.length; i++)
                    if (studentVoicePostList[i].writer == myUser.nickname)
                      Column(
                        children: [
                          ListTile(
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
                          const Divider(),
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
import 'package:flutter/material.dart';

import 'package:mealis/announcement_page.dart';
import 'package:mealis/database.dart';
import 'package:mealis/one_announcement_page.dart';

class ForumPage extends StatefulWidget {
  const ForumPage(this.goToPage, {Key? key}) : super(key: key);
  final void Function(int index) goToPage;

  @override
  State<ForumPage> createState() => _ForumPageState(goToPage);
}

class _ForumPageState extends State<ForumPage> {
  _ForumPageState(this.goToPage);
  final void Function(int index) goToPage;

  int showRecentAnnouncementNum = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                goToPage(2);
              },
            ),
            title: const Text('Forum'),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: [
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.restaurant),
                          title: const Text('Announcement'),
                          subtitle: const Text('Restaurant'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AnnouncementPage(),
                              ),
                            );
                          },
                        ),
                        Column(
                          children: [
                            for (int i = 0; i < showRecentAnnouncementNum; i++)
                              ListTile(
                                // leading: const Icon(Icons.restaurant),
                                title: Text(announcementPostList[i].title),
                                subtitle: Text(announcementPostList[i].writer),
                                trailing: const Icon(Icons.arrow_forward_ios),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OneAnnouncementPage(i),
                                    ),
                                  );
                                },
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
        ],
      ),
    );
  }
}
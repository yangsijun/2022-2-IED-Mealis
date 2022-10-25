import 'package:flutter/material.dart';
import 'package:mealis/database.dart';
import 'package:mealis/one_announcement_page.dart';

class AnnouncementPage extends StatefulWidget {
  const AnnouncementPage({Key? key}) : super(key: key);

  @override
  State<AnnouncementPage> createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
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
            title: const Text('Announcement'),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: [
                  for (int i = 0; i < announcementPostList.length; i++)
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      color: Theme.of(context).colorScheme.surface,
                      child: Column(
                        children: [
                          ListTile(
                            // leading: const Icon(Icons.restaurant),
                            title: Text(announcementPostList[i].title),
                            subtitle: Text(announcementPostList[i].writer),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OneAnnouncementPage(i),
                                ),
                              );
                            },
                          ),
                          const Divider(height: 1),
                        ],
                      ),
                    ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
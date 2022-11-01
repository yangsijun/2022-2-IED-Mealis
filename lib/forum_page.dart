import 'package:flutter/material.dart';

import 'package:mealis/announcement_page.dart';
import 'package:mealis/database.dart';
import 'package:mealis/one_announcement_page.dart';
import 'package:mealis/one_student_voice_page.dart';
import 'package:mealis/student_voice_page.dart';

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
  int showRecentStudentVoiceNum = 5;

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
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.announcement),
                            title: const Text('Announcement'),
                            subtitle: const Text('Restaurant'),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AnnouncementPage(),
                                ),
                              ).then((value) => setState(() {}));
                            },
                          ),
                          Column(
                            children: [
                              for (int i = 0; i < showRecentAnnouncementNum; i++)
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
                                          ).then((value) => setState(() {}));
                                        },
                                      ),
                                      const Divider(height: 1),
                                    ],
                                  ),
                                ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.record_voice_over),
                            title: const Text('Student\'s Voice'),
                            subtitle: const Text('Handong Students'),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const StudentVoicePage(),
                                ),
                              ).then((value) => setState(() {}));
                            },
                          ),
                          Column(
                            children: [
                              for (int i = 0; i < showRecentStudentVoiceNum; i++)
                                Container(
                                  margin: const EdgeInsets.only(left: 10, right: 10),
                                  color: Theme.of(context).colorScheme.surface,
                                  child: Column(
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
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          ButtonBar(
                                            alignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              ActionChip(
                                                avatar: Icon(Icons.thumb_up, color: (myEvalForStudentVoicePostList[i].isLiked) ? Colors.blueAccent : Theme.of(context).chipTheme.surfaceTintColor),
                                                label: Text(studentVoicePostList[i].like.toString(), style: TextStyle(color: (myEvalForStudentVoicePostList[i].isLiked) ? Colors.blueAccent : Theme.of(context).chipTheme.surfaceTintColor, fontSize: 14)),
                                                onPressed: () {
                                                  setState(() {
                                                    if (myEvalForStudentVoicePostList[i].isLiked) {
                                                      studentVoicePostList[i].like--;
                                                      myEvalForStudentVoicePostList[i].isLiked = false;
                                                    } else {
                                                      if (myEvalForStudentVoicePostList[i].isDisliked) {
                                                        studentVoicePostList[i].dislike--;
                                                        myEvalForStudentVoicePostList[i].isDisliked = false;
                                                      }
                                                      studentVoicePostList[i].like++;
                                                      myEvalForStudentVoicePostList[i].isLiked = true;
                                                    }
                                                  });
                                                },
                                              ),
                                              ActionChip(
                                                avatar: Icon(Icons.thumb_down, color: (myEvalForStudentVoicePostList[i].isDisliked) ? Colors.redAccent : Theme.of(context).chipTheme.surfaceTintColor),
                                                label: Text(studentVoicePostList[i].dislike.toString(), style: TextStyle(color: (myEvalForStudentVoicePostList[i].isDisliked) ? Colors.redAccent : Theme.of(context).chipTheme.surfaceTintColor, fontSize: 14)),
                                                onPressed: () {
                                                  setState(() {
                                                    if (myEvalForStudentVoicePostList[i].isDisliked) {
                                                      studentVoicePostList[i].dislike--;
                                                      myEvalForStudentVoicePostList[i].isDisliked = false;
                                                    } else {
                                                      if (myEvalForStudentVoicePostList[i].isLiked) {
                                                        studentVoicePostList[i].like--;
                                                        myEvalForStudentVoicePostList[i].isLiked = false;
                                                      }
                                                      studentVoicePostList[i].dislike++;
                                                      myEvalForStudentVoicePostList[i].isDisliked = true;
                                                    }
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Divider(height: 1),
                                    ],
                                  ),
                                ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mealis/database.dart';
import 'package:mealis/one_student_voice_page.dart';

class StudentVoicePage extends StatefulWidget {
  const StudentVoicePage({Key? key}) : super(key: key);

  @override
  State<StudentVoicePage> createState() => _StudentVoicePageState();
}

class _StudentVoicePageState extends State<StudentVoicePage> {
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
            title: const Text('Student\'s Voice'),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: [
                  for (int i = 0; i < studentVoicePostList.length; i++)
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
                                  );
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
                            ],
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
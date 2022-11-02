import 'package:flutter/material.dart';
import 'package:mealis/database.dart';
import 'package:mealis/main.dart';
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
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  studentVoiceDialog(context).then((value) => setState(() {myUser.exp += 20;}));
                },
              ),
            ],
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
                                              myUser.exp -= 1;
                                            } else {
                                              if (myEvalForStudentVoicePostList[i].isDisliked) {
                                                studentVoicePostList[i].dislike--;
                                                myEvalForStudentVoicePostList[i].isDisliked = false;
                                                myUser.exp -= 1;
                                              }
                                              studentVoicePostList[i].like++;
                                              myEvalForStudentVoicePostList[i].isLiked = true;
                                              myUser.exp += 1;
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
                                              myUser.exp -= 1;
                                            } else {
                                              if (myEvalForStudentVoicePostList[i].isLiked) {
                                                studentVoicePostList[i].like--;
                                                myEvalForStudentVoicePostList[i].isLiked = false;
                                                myUser.exp -= 1;
                                              }
                                              studentVoicePostList[i].dislike++;
                                              myEvalForStudentVoicePostList[i].isDisliked = true;
                                              myUser.exp += 1;
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

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  Future<void> studentVoiceDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Student\'s Voice'),
              centerTitle: false,
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  _titleController.clear();
                  _contentController.clear();
                },
                icon: const Icon(Icons.close),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    if (_titleController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter the title.'),
                        ),
                      );
                    } else if (_contentController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter the content.'),
                        ),
                      );
                    } else {
                      studentVoicePostList.insert(
                        0,
                        StudentVoicePost(
                          myUser.nickname,
                          DateTime.now(),
                          _titleController.text,
                          _contentController.text,
                          0,
                          0,
                        ),
                      );
                      myEvalForStudentVoicePostList.insert(
                        0,
                        MyEvalForStudentVoicePost(),
                      );
                      Navigator.pop(context);
                      _titleController.clear();
                      _contentController.clear();
                    }
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
                      controller: _titleController,
                      focusNode: FocusNode(),
                      autofocus: true,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: _contentController,
                      maxLines: 10,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Content',
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
}
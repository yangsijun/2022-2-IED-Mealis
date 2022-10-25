import 'package:flutter/material.dart';
import 'package:mealis/database.dart';
import 'package:mealis/main.dart';

class OneStudentVoicePage extends StatefulWidget {
  const OneStudentVoicePage(this.studentVoiceIndex, {Key? key}) : super(key: key);
  final int studentVoiceIndex;

  @override
  State<OneStudentVoicePage> createState() => _OneStudentVoicePageState(studentVoiceIndex);
}

class _OneStudentVoicePageState extends State<OneStudentVoicePage> {
  _OneStudentVoicePageState(this.studentVoiceIndex);
  final int studentVoiceIndex;

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
            title: Text(studentVoicePostList[studentVoiceIndex].title),
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
                          Text(studentVoicePostList[studentVoiceIndex].writer, style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('Date: '),
                          Text(studentVoicePostList[studentVoiceIndex].date.toString(), style: Theme.of(context).textTheme.bodyMedium),
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
                        child: Text(studentVoicePostList[studentVoiceIndex].content, style: Theme.of(context).textTheme.bodyLarge),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Card(
                      child: Column(
                        children: <Widget>[
                          ButtonBar(
                            alignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ActionChip(
                                avatar: Icon(Icons.thumb_up, color: (myEvalForStudentVoicePostList[studentVoiceIndex].isLiked) ? Colors.blueAccent : Theme.of(context).chipTheme.surfaceTintColor),
                                label: Text(studentVoicePostList[studentVoiceIndex].like.toString(), style: TextStyle(color: (myEvalForStudentVoicePostList[studentVoiceIndex].isLiked) ? Colors.blueAccent : Theme.of(context).chipTheme.surfaceTintColor, fontSize: 14)),
                                onPressed: () {
                                  setState(() {
                                    if (myEvalForStudentVoicePostList[studentVoiceIndex].isLiked) {
                                      studentVoicePostList[studentVoiceIndex].like--;
                                      myEvalForStudentVoicePostList[studentVoiceIndex].isLiked = false;
                                    } else {
                                      if (myEvalForStudentVoicePostList[studentVoiceIndex].isDisliked) {
                                        studentVoicePostList[studentVoiceIndex].dislike--;
                                        myEvalForStudentVoicePostList[studentVoiceIndex].isDisliked = false;
                                      }
                                      studentVoicePostList[studentVoiceIndex].like++;
                                      myEvalForStudentVoicePostList[studentVoiceIndex].isLiked = true;
                                    }
                                  });
                                },
                              ),
                              ActionChip(
                                avatar: Icon(Icons.thumb_down, color: (myEvalForStudentVoicePostList[studentVoiceIndex].isDisliked) ? Colors.redAccent : Theme.of(context).chipTheme.surfaceTintColor),
                                label: Text(studentVoicePostList[studentVoiceIndex].dislike.toString(), style: TextStyle(color: (myEvalForStudentVoicePostList[studentVoiceIndex].isDisliked) ? Colors.redAccent : Theme.of(context).chipTheme.surfaceTintColor, fontSize: 14)),
                                onPressed: () {
                                  setState(() {
                                    if (myEvalForStudentVoicePostList[studentVoiceIndex].isDisliked) {
                                      studentVoicePostList[studentVoiceIndex].dislike--;
                                      myEvalForStudentVoicePostList[studentVoiceIndex].isDisliked = false;
                                    } else {
                                      if (myEvalForStudentVoicePostList[studentVoiceIndex].isLiked) {
                                        studentVoicePostList[studentVoiceIndex].like--;
                                        myEvalForStudentVoicePostList[studentVoiceIndex].isLiked = false;
                                      }
                                      studentVoicePostList[studentVoiceIndex].dislike++;
                                      myEvalForStudentVoicePostList[studentVoiceIndex].isDisliked = true;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
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
                                      postCommentList.insert(1, PostComment(1, studentVoiceIndex, nickname, DateTime.now(), postCommentController.text));
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
                          if (postCommentList[i].postType == 0 && postCommentList[i].postIndex == studentVoiceIndex)
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
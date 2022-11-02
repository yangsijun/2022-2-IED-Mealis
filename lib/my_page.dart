import 'package:flutter/material.dart';
import 'package:mealis/database.dart';
import 'package:mealis/my_posts_page.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  TextEditingController _nicknameController = TextEditingController(text: myUser.nickname);
  bool _nicknameReadOnly = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text('My Page'),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: TextButton(
                      child: const Text('Log Out'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: Stack(
                        children: [
                          ClipOval(
                            child: Material(
                              color: Colors.transparent,
                              child: Ink.image(
                                image: NetworkImage('https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                                fit: BoxFit.cover,
                                width: 128,
                                height: 128,
                                child: InkWell(
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 4,
                            child: ClipOval(
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                color: Colors.white,
                                child: ClipOval(
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    color: Theme.of(context).colorScheme.primary,
                                    child: InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          child: TextField(
                            controller: _nicknameController,
                            autofocus: true,
                            readOnly: _nicknameReadOnly,
                            maxLines: 1,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: IconButton(
                            onPressed: () {
                              if (!_nicknameReadOnly) {
                                for (StudentVoicePost post in studentVoicePostList) {
                                  if (post.writer == myUser.nickname) {
                                    post.writer = _nicknameController.text;
                                  }
                                }
                                myUser.nickname = _nicknameController.text;
                              } else {
                                _nicknameController.text = myUser.nickname;
                                _nicknameController.selection = TextSelection.fromPosition(TextPosition(offset: _nicknameController.text.length));
                              }
                              setState(() {
                                _nicknameReadOnly = !_nicknameReadOnly;
                              });
                            },
                            icon: (_nicknameReadOnly) ? const Icon(Icons.edit) : const Icon(Icons.check),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: [
                          LinearProgressIndicator(
                            value: myUser.exp / expTable[myUser.level],
                            valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.primary),
                            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                            minHeight: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Level ${myUser.level} ',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Text(
                                '(${myUser.exp}/${expTable[myUser.level]})',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ListView(
                      shrinkWrap: true,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.article),
                          title: const Text('My Posts'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyPostsPage(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.add_alert),
                          title: const Text('Alert Settings'),
                          onTap: () {},
                        ),
                      ],
                    ),
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

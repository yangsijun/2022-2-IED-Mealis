import 'package:flutter/cupertino.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({Key? key}) : super(key: key);

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) {
        return const CupertinoPageScaffold(
          child: Center(
            child: Text('Forum'),
          ),
        );
      },
    );
  }
}
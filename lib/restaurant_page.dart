import 'package:flutter/cupertino.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) {
        return const CupertinoPageScaffold(
          child: Center(
            child: Text('Restaurant'),
          ),
        );
      },
    );
  }
}
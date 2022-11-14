import 'package:mealis/stat.dart';

class Menu {
  String menuName;
  String restaurantName;
  int price;
  Stat stat;
  String image;
  bool isAvailable;

  Menu(this.menuName, this.restaurantName, this.price, this.stat, this.image, this.isAvailable);
}
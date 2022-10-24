import 'package:mealis/menu.dart';
import 'package:mealis/stat.dart';

List<String> restaurantList = [
  'Mix Rice',
  'Korean Table',
  'H.Plate',
  'Mom\'s Kitchen',
  'Handong Lounge',
  'Burger King',
  'The Grace Table',
  'In Breeze (Bokjidong)',
  'Red Neoguri',
  'Farm\'s Valley',
  'Han\'s Deli',
  'In Breeze (Papyrus)',
];

Map<String, Menu> menuMap = {
  'Pork Cutlet Kimchi Udon' : Menu('Pork Cutlet Kimchi Udon', 'Mix Rice', Stat(26, 107, 2)),
  'Tendon' : Menu('Tendon', 'Mix Rice', Stat(10, 10, 10)),
  'Backbone Spicy Soup' : Menu('Backbone Spicy Soup', 'Mix Rice', Stat(10, 10, 10)),
  'Sirlon Donkatsu' : Menu('Sirlon Donkatsu', 'H.Plate', Stat(10, 10, 10)),
  'Spicy Donkatsu' : Menu('Spicy Donkatsu', 'H.Plate', Stat(10, 10, 10)),
  'Rose Pasta' : Menu('Rose Pasta', 'H.Plate', Stat(15, 76, 16)),
  'Bean Sprout Radish Beef Soup': Menu('Bean Sprout Radish Beef Soup', 'Mom\'s Kitchen', Stat(10, 10, 10)),
  'Handmade Donkatsu' : Menu('Handmade Donkatsu', 'Mom\'s Kitchen', Stat(10, 10, 10)),
  'Samgyetang' : Menu('Samgyetang', 'Mom\'s Kitchen', Stat(20, 85, 10)),
  'Korean Black Noodle' : Menu('Korean Black Noodle', 'Handong Lounge', Stat(10, 10, 10)),
  'Nagasaki Jjampong' : Menu('Nagasaki Jjampong', 'Handong Lounge', Stat(10, 10, 10)),
  'Pork Soup' : Menu('Pork Soup', 'Handong Lounge', Stat(10, 10, 10)),
  'Thai Lemon Chicken and Garlic Rice' : Menu('Thai Lemon Chicken and Garlic Rice', 'The Grace Table', Stat(10, 10, 10)),
  'Beef Curry' : Menu('Beef Curry', 'The Grace Table', Stat(10, 10, 10)),
  'Quesadilla' : Menu('Quesadilla', 'The Grace Table', Stat(10, 10, 10)),
  'Cockle Bibimbap' : Menu('Cockle Bibimbap', 'The Grace Table', Stat(10, 10, 10)),
  'Double Cheeseburger' : Menu('Double Cheeseburger', 'The Grace Table', Stat(10, 10, 10)),
  'Burrito Bowl' : Menu('Burrito Bowl', 'The Grace Table', Stat(10, 10, 10)),
  'Thai Beef Salad' : Menu('Thai Beef Salad', 'The Grace Table', Stat(10, 10, 10)),
  'Braised Chicken' : Menu('Braised Chicken', 'Han\'s Deli', Stat(10, 10, 10)),
  'Braised Chicken with Cheese' : Menu('Braised Chicken with Cheese', 'Han\'s Deli', Stat(10, 10, 10)),
};
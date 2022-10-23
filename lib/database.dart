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
  'Pork Cutlet Kimchi Udon' : Menu('Pork Cutlet Kimchi Udon', 'Mix Rice', Stat(100, 100, 100)),
  'Tendon' : Menu('Tendon', 'Mix Rice', Stat(100, 100, 100)),
  'Backbone Spicy Soup' : Menu('Backbone Spicy Soup', 'Mix Rice', Stat(100, 100, 100)),
  'Sirlon Donkatsu' : Menu('Sirlon Donkatsu', 'H.Plate', Stat(100, 100, 100)),
  'Spicy Donkatsu' : Menu('Spicy Donkatsu', 'H.Plate', Stat(100, 100, 100)),
  'Rose Pasta' : Menu('Rose Pasta', 'H.Plate', Stat(100, 100, 100)),
  'Bean Sprout Radish Beef Soup': Menu('Bean Sprout Radish Beef Soup', 'Mom\'s Kitchen', Stat(100, 100, 100)),
  'Handmade Donkatsu' : Menu('Handmade Donkatsu', 'Mom\'s Kitchen', Stat(100, 100, 100)),
  'Samgyetang' : Menu('Samgyetang', 'Mom\'s Kitchen', Stat(100, 100, 100)),
  'Korean Black Noodle' : Menu('Korean Black Noodle', 'Handong Lounge', Stat(100, 100, 100)),
  'Nagasaki Jjampong' : Menu('Nagasaki Jjampong', 'Handong Lounge', Stat(100, 100, 100)),
  'Pork Soup' : Menu('Pork Soup', 'Handong Lounge', Stat(100, 100, 100)),
  'Thai Lemon Chicken and Garlic Rice' : Menu('Thai Lemon Chicken and Garlic Rice', 'The Grace Table', Stat(100, 100, 100)),
  'Beef Curry' : Menu('Beef Curry', 'The Grace Table', Stat(100, 100, 100)),
  'Quesadilla' : Menu('Quesadilla', 'The Grace Table', Stat(100, 100, 100)),
  'Cockle Bibimbap' : Menu('Cockle Bibimbap', 'The Grace Table', Stat(100, 100, 100)),
  'Double Cheeseburger' : Menu('Double Cheeseburger', 'The Grace Table', Stat(100, 100, 100)),
  'Burrito Bowl' : Menu('Burrito Bowl', 'The Grace Table', Stat(100, 100, 100)),
  'Thai Beef Salad' : Menu('Thai Beef Salad', 'The Grace Table', Stat(100, 100, 100)),
  'Braised Chicken' : Menu('Braised Chicken', 'Han\'s Deli', Stat(100, 100, 100)),
  'Braised Chicken with Cheese' : Menu('Braised Chicken with Cheese', 'Han\'s Deli', Stat(100, 100, 100)),
};
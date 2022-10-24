import 'package:mealis/menu.dart';
import 'package:mealis/stat.dart';
import 'package:mealis/comment.dart';

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
  'Pork Cutlet Kimchi Udon' : Menu('Pork Cutlet Kimchi Udon', 'Mix Rice', Stat(107, 2, 26)),
  'Tendon' : Menu('Tendon', 'Mix Rice', Stat(10, 10, 10)),
  'Backbone Spicy Soup' : Menu('Backbone Spicy Soup', 'Mix Rice', Stat(10, 10, 10)),
  'Sirlon Donkatsu' : Menu('Sirlon Donkatsu', 'H.Plate', Stat(10, 10, 10)),
  'Spicy Donkatsu' : Menu('Spicy Donkatsu', 'H.Plate', Stat(10, 10, 10)),
  'Rose Pasta' : Menu('Rose Pasta', 'H.Plate', Stat(76, 16, 15)),
  'Bean Sprout Radish Beef Soup': Menu('Bean Sprout Radish Beef Soup', 'Mom\'s Kitchen', Stat(10, 10, 10)),
  'Handmade Donkatsu' : Menu('Handmade Donkatsu', 'Mom\'s Kitchen', Stat(10, 10, 10)),
  'Samgyetang' : Menu('Samgyetang', 'Mom\'s Kitchen', Stat(85, 10, 20)),
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

List<Menu?> menuRankingList = [
  menuMap['Pork Cutlet Kimchi Udon'],
  menuMap['Samgyetang'],
  menuMap['Rose Pasta'],
  menuMap['Tendon'],
  menuMap['Backbone Spicy Soup'],
  menuMap['Sirlon Donkatsu'],
  menuMap['Spicy Donkatsu'],
  menuMap['Bean Sprout Radish Beef Soup'],
  menuMap['Handmade Donkatsu'],
  menuMap['Korean Black Noodle'],
  menuMap['Nagasaki Jjampong'],
  menuMap['Pork Soup'],
  menuMap['Thai Lemon Chicken and Garlic Rice'],
  menuMap['Beef Curry'],
  menuMap['Quesadilla'],
  menuMap['Cockle Bibimbap'],
  menuMap['Double Cheeseburger'],
  menuMap['Burrito Bowl'],
  menuMap['Thai Beef Salad'],
  menuMap['Braised Chicken'],
  menuMap['Braised Chicken with Cheese'],
];

List<Comment> realTimeCommentList = [
  Comment('Pork Cutlet Kimchi Udon', 'JMT'),
  Comment('Samgyetang', 'This is really like my mom\'s cooking!'),
  Comment('Nagasaki Jjampong', 'It was fine for me.'),
  Comment('Pork Cutlet Kimchi Udon', 'Best food in Handong.'),
  Comment('Backbone Spicy Soup', 'It was so spicy for me.'),
  Comment('Tendon', 'Nice'),
  Comment('Korean Black Noodle', 'Not bad'),
  Comment('Pork Soup', 'I like it'),
  Comment('Sirlon Donkatsu', 'Not good at all'),
  Comment('Samqyetang', 'Absolutely delicious'),
];

class MyEvalForMenu {
  bool isLiked = false;
  bool isDisliked = false;
  bool isCommented = false;

  MyEvalForMenu();
}

Map<String, MyEvalForMenu> myEvalMap = {
  'Pork Cutlet Kimchi Udon' : MyEvalForMenu(),
  'Tendon' : MyEvalForMenu(),
  'Backbone Spicy Soup' : MyEvalForMenu(),
  'Sirlon Donkatsu' : MyEvalForMenu(),
  'Spicy Donkatsu' : MyEvalForMenu(),
  'Rose Pasta' : MyEvalForMenu(),
  'Bean Sprout Radish Beef Soup': MyEvalForMenu(),
  'Handmade Donkatsu' : MyEvalForMenu(),
  'Samgyetang' : MyEvalForMenu(),
  'Korean Black Noodle' : MyEvalForMenu(),
  'Nagasaki Jjampong' : MyEvalForMenu(),
  'Pork Soup' : MyEvalForMenu(),
  'Thai Lemon Chicken and Garlic Rice' : MyEvalForMenu(),
  'Beef Curry' : MyEvalForMenu(),
  'Quesadilla' : MyEvalForMenu(),
  'Cockle Bibimbap' : MyEvalForMenu(),
  'Double Cheeseburger' : MyEvalForMenu(),
  'Burrito Bowl' : MyEvalForMenu(),
  'Thai Beef Salad' : MyEvalForMenu(),
  'Braised Chicken' : MyEvalForMenu(),
  'Braised Chicken with Cheese' : MyEvalForMenu(),
};
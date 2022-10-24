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
  'Pork Cutlet Kimchi Udon' : Menu('Pork Cutlet Kimchi Udon', 'Mix Rice', Stat(107, 2, 5), 'assets/images/pork_cutlet_kimchi_udon.jpg'),
  'Tendon' : Menu('Tendon', 'Mix Rice', Stat(30, 10, 3), 'assets/images/tendon.jpg'),
  'Backbone Spicy Soup' : Menu('Backbone Spicy Soup', 'Mix Rice', Stat(28, 10, 2), 'assets/images/backbone_spicy_soup.jpg'),
  'Sirlon Donkatsu' : Menu('Sirlon Donkatsu', 'H.Plate', Stat(26, 10, 1), 'assets/images/sirlon_donkatsu.jpg'),
  'Spicy Donkatsu' : Menu('Spicy Donkatsu', 'H.Plate', Stat(24, 10, 2), 'assets/images/spicy_donkatsu.jpg'),
  'Rose Pasta' : Menu('Rose Pasta', 'H.Plate', Stat(76, 16, 5), 'assets/images/rose_pasta.jpg'),
  'Bean Sprout Radish Beef Soup': Menu('Bean Sprout Radish Beef Soup', 'Mom\'s Kitchen', Stat(22, 10, 0), 'assets/images/bean_sprout_radish_beef_soup.jpg'),
  'Handmade Donkatsu' : Menu('Handmade Donkatsu', 'Mom\'s Kitchen', Stat(20, 10, 2), 'assets/images/handmade_donkatsu.jpg'),
  'Samgyetang' : Menu('Samgyetang', 'Mom\'s Kitchen', Stat(85, 10, 4), 'assets/images/samgyetang.jpg'),
  'Korean Black Noodle' : Menu('Korean Black Noodle', 'Handong Lounge', Stat(19, 10, 2), 'assets/images/korean_black_noodle.jpg'),
  'Nagasaki Jjampong' : Menu('Nagasaki Jjampong', 'Handong Lounge', Stat(18, 10, 3), 'assets/images/nagasaki_jjampong.jpg'),
  'Pork Soup' : Menu('Pork Soup', 'Handong Lounge', Stat(17, 10, 2), 'assets/images/pork_soup.jpg'),
  'Thai Lemon Chicken and Garlic Rice' : Menu('Thai Lemon Chicken and Garlic Rice', 'The Grace Table', Stat(16, 10, 0), 'assets/images/thai_lemon_chicken_and_garlic_rice.jpg'),
  'Beef Curry' : Menu('Beef Curry', 'The Grace Table', Stat(15, 10, 0), 'assets/images/beef_curry.jpg'),
  'Quesadilla' : Menu('Quesadilla', 'The Grace Table', Stat(14, 10, 0), 'assets/images/quesadilla.jpg'),
  'Cockle Bibimbap' : Menu('Cockle Bibimbap', 'The Grace Table', Stat(13, 10, 0), 'assets/images/cockle_bibimbap.jpg'),
  'Double Cheeseburger' : Menu('Double Cheeseburger', 'The Grace Table', Stat(13, 10, 1), 'assets/images/double_cheeseburger.jpg'),
  'Burrito Bowl' : Menu('Burrito Bowl', 'The Grace Table', Stat(12, 10, 0), 'assets/images/burrito_bowl.jpg'),
  'Thai Beef Salad' : Menu('Thai Beef Salad', 'The Grace Table', Stat(11, 10, 0), 'assets/images/thai_beef_salad.jpg'),
  'Braised Chicken' : Menu('Braised Chicken', 'Han\'s Deli', Stat(10, 10, 0), 'assets/images/braised_chicken.jpg'),
  'Braised Chicken with Cheese' : Menu('Braised Chicken with Cheese', 'Han\'s Deli', Stat(26, 5, 2), 'assets/images/braised_chicken_with_cheese.jpg'),
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

List<Comment> commentList = [
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
  Comment('Pork Cutlet Kimchi Udon', 'Nice'),
  Comment('Double Cheeseburger', 'I like it'),
  Comment('Rose Pasta', 'Good'),
  Comment('Tendon', 'Wow'),
  Comment('Backbone Spicy Soup', 'Nice'),
  Comment('Pork Cutlet Kimchi Udon', 'Hmm...'),
  Comment('Rose Pasta', 'I love it'),
  Comment('Spicy Donkatsu', 'I like it'),
  Comment('Braised Chicken with Cheese', 'Good, Always'),
  Comment('Backbone Spicy Soup', 'Good'),
  Comment('Rose Pasta', 'Not good at all'),
  Comment('Rose Pasta', 'Nice'),
  Comment('Samqyetang', 'Good'),
  Comment('Handmade Donkatsu', 'Best'),
  Comment('Spicy Donkatsu', 'Not bad'),
  Comment('Pork Cutlet Kimchi Udon', 'Not best'),
  Comment('Handmade Donkatsu', 'Nice'),
  Comment('Tendon', 'I Love it'),
  Comment('Nagasaki Jjampong', 'Nice'),
  Comment('Samqyetang', 'Nice'),
  Comment('Korean Black Noodle', 'I like it'),
  Comment('Nagasaki Jjampong', 'I love it'),
  Comment('Pork Soup', 'Good'),
  Comment('Rose Pasta', 'I like it'),
  Comment('Braised Chicken with Cheese', 'Nice'),
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

class RestaurantInfo {
  List<String> operatingTimeTextList;
  int waitingTime;
  int waitingPeople;

  RestaurantInfo(this.operatingTimeTextList, this.waitingTime, this.waitingPeople);
}

Map<String, RestaurantInfo> restaurantInfoMap = {
  'Mix Rice' : RestaurantInfo(
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    8,
    12,
  ),
  'Korean Table' : RestaurantInfo(
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    5,
    10,
  ),
  'H.Plate' : RestaurantInfo(
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    10,
    5,
  ),
  'Mom\'s Kitchen' : RestaurantInfo(
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    3,
    8,
  ),
  'Handong Lounge' : RestaurantInfo(
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    15,
    40,
  ),
  'Burger King' : RestaurantInfo(
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    25,
    25,
  ),
  'The Grace Table' : RestaurantInfo(
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    22,
    10,
  ),
  'In Breeze (Bokjidong)' : RestaurantInfo(
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    24,
    8,
  ),
  'Red Neoguri' : RestaurantInfo(
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    24,
    17,
  ),
  'Farm\'s Valley' : RestaurantInfo(
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    21,
    4,
  ),
  'Han\'s Deli' : RestaurantInfo(
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    16,
    4,
  ),
  'In Breeze (Papyrus)' : RestaurantInfo(
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    22,
    5,
  ),
};
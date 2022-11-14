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
  'Pork Cutlet Kimchi Udon' : Menu(
      'Pork Cutlet Kimchi Udon',
      'Mix Rice',
      5000,
      Stat(107, 2, 5),
      'assets/images/pork_cutlet_kimchi_udon.jpg'
  ),
  'Tendon' : Menu(
      'Tendon',
      'Mix Rice',
      5000,
      Stat(30, 10, 3),
      'assets/images/tendon.jpg'
  ),
  'Backbone Spicy Soup' : Menu(
      'Backbone Spicy Soup',
      'Mix Rice',
      4600,
      Stat(28, 10, 2),
      'assets/images/backbone_spicy_soup.jpg'
  ),
  'Sirlon Donkatsu' : Menu(
      'Sirlon Donkatsu',
      'H.Plate',
      4300,
      Stat(26, 10, 1),
      'assets/images/sirlon_donkatsu.jpg'
  ),
  'Spicy Donkatsu' : Menu(
      'Spicy Donkatsu',
      'H.Plate',
      5000,
      Stat(24, 10, 2),
      'assets/images/spicy_donkatsu.jpg'
  ),
  'Rose Pasta' : Menu(
      'Rose Pasta',
      'H.Plate',
      5000,
      Stat(76, 16, 5),
      'assets/images/rose_pasta.jpg'
  ),
  'Bean Sprout Radish Beef Soup': Menu(
      'Bean Sprout Radish Beef Soup',
      'Mom\'s Kitchen',
      5000,
      Stat(22, 10, 0),
      'assets/images/bean_sprout_radish_beef_soup.jpg'
  ),
  'Handmade Donkatsu' : Menu(
      'Handmade Donkatsu',
      'Mom\'s Kitchen',
      5000,
      Stat(20, 10, 2),
      'assets/images/handmade_donkatsu.jpg'
  ),
  'Samgyetang' : Menu(
      'Samgyetang',
      'Mom\'s Kitchen',
      5000,
      Stat(85, 10, 4),
      'assets/images/samgyetang.jpg'
  ),
  'Korean Black Noodle' : Menu(
      'Korean Black Noodle',
      'Handong Lounge',
      5000,
      Stat(19, 10, 2),
      'assets/images/korean_black_noodle.jpg'
  ),
  'Nagasaki Jjampong' : Menu(
      'Nagasaki Jjampong',
      'Handong Lounge',
      5000,
      Stat(18, 10, 3),
      'assets/images/nagasaki_jjampong.jpg'),
  'Pork Soup' : Menu(
      'Pork Soup',
      'Handong Lounge',
      5000,
      Stat(17, 10, 2),
      'assets/images/pork_soup.jpg'),
  'Thai Lemon Chicken and Garlic Rice' : Menu(
      'Thai Lemon Chicken and Garlic Rice',
      'The Grace Table',
      5000,
      Stat(16, 10, 0),
      'assets/images/thai_lemon_chicken_and_garlic_rice.jpg'),
  'Beef Curry' : Menu(
      'Beef Curry',
      'The Grace Table',
      5000,
      Stat(15, 10, 0),
      'assets/images/beef_curry.jpg'),
  'Quesadilla' : Menu(
      'Quesadilla',
      'The Grace Table',
      5000,
      Stat(14, 10, 0),
      'assets/images/quesadilla.jpg'),
  'Cockle Bibimbap' : Menu(
      'Cockle Bibimbap',
      'The Grace Table',
      5000,
      Stat(13, 10, 0),
      'assets/images/cockle_bibimbap.jpg'),
  'Double Cheeseburger' : Menu(
      'Double Cheeseburger',
      'The Grace Table',
      5000,
      Stat(13, 10, 1),
      'assets/images/double_cheeseburger.jpg'),
  'Burrito Bowl' : Menu(
      'Burrito Bowl',
      'The Grace Table',
      5000,
      Stat(12, 10, 0),
      'assets/images/burrito_bowl.jpg'),
  'Thai Beef Salad' : Menu(
      'Thai Beef Salad',
      'The Grace Table',
      5000,
      Stat(11, 10, 0),
      'assets/images/thai_beef_salad.jpg'),
  'Braised Chicken' : Menu(
      'Braised Chicken',
      'Han\'s Deli',
      5000,
      Stat(10, 10, 0),
      'assets/images/braised_chicken.jpg'),
  'Braised Chicken with Cheese' : Menu(
      'Braised Chicken with Cheese',
      'Han\'s Deli',
      5000,
      Stat(26, 5, 2),
      'assets/images/braised_chicken_with_cheese.jpg'),
};

List<MenuComment> commentList = [
  MenuComment('Pork Cutlet Kimchi Udon', 'JMT', DateTime(2022, 11, 17, 12, 51)),
  MenuComment('Samgyetang', 'This is really like my mom\'s cooking!', DateTime(2022, 11, 17, 12, 50)),
  MenuComment('Nagasaki Jjampong', 'It was fine for me.', DateTime(2022, 11, 17, 12, 49)),
  MenuComment('Pork Cutlet Kimchi Udon', 'Best food in Handong.', DateTime(2022, 11, 17, 12, 48)),
  MenuComment('Backbone Spicy Soup', 'It was so spicy for me.', DateTime(2022, 11, 17, 12, 47)),
  MenuComment('Tendon', 'Nice', DateTime(2022, 11, 17, 12, 46)),
  MenuComment('Korean Black Noodle', 'Not bad', DateTime(2022, 11, 17, 12, 45)),
  MenuComment('Pork Soup', 'I like it', DateTime(2022, 11, 17, 12, 44)),
  MenuComment('Sirlon Donkatsu', 'Not good at all', DateTime(2022, 11, 17, 12, 43)),
  MenuComment('Samgyetang', 'Absolutely delicious', DateTime(2022, 11, 17, 12, 42)),
  MenuComment('Pork Cutlet Kimchi Udon', 'Nice', DateTime(2022, 11, 17, 12, 41)),
  MenuComment('Double Cheeseburger', 'I like it', DateTime(2022, 11, 17, 12, 40)),
  MenuComment('Rose Pasta', 'Good', DateTime(2022, 11, 17, 12, 39)),
  MenuComment('Tendon', 'Wow', DateTime(2022, 11, 17, 12, 38)),
  MenuComment('Backbone Spicy Soup', 'Nice', DateTime(2022, 11, 17, 12, 37)),
  MenuComment('Pork Cutlet Kimchi Udon', 'Hmm...', DateTime(2022, 11, 17, 12, 36)),
  MenuComment('Rose Pasta', 'I love it', DateTime(2022, 11, 17, 12, 35)),
  MenuComment('Spicy Donkatsu', 'I like it', DateTime(2022, 11, 17, 12, 34)),
  MenuComment('Braised Chicken with Cheese', 'Good, Always', DateTime(2022, 11, 17, 12, 33)),
  MenuComment('Backbone Spicy Soup', 'Good', DateTime(2022, 11, 17, 12, 32)),
  MenuComment('Rose Pasta', 'Not good at all', DateTime(2022, 11, 17, 12, 31)),
  MenuComment('Rose Pasta', 'Nice', DateTime(2022, 11, 17, 12, 30)),
  MenuComment('Samgyetang', 'Good', DateTime(2022, 11, 12, 12, 42)),
  MenuComment('Handmade Donkatsu', 'Best', DateTime(2022, 11, 12, 12, 41)),
  MenuComment('Spicy Donkatsu', 'Not bad', DateTime(2022, 11, 12, 12, 40)),
  MenuComment('Pork Cutlet Kimchi Udon', 'Not best', DateTime(2022, 11, 12, 12, 39)),
  MenuComment('Handmade Donkatsu', 'Nice', DateTime(2022, 11, 12, 12, 38)),
  MenuComment('Tendon', 'I Love it', DateTime(2022, 11, 12, 12, 37)),
  MenuComment('Nagasaki Jjampong', 'Nice', DateTime(2022, 11, 12, 12, 36)),
  MenuComment('Samqyetang', 'Nice', DateTime(2022, 11, 12, 12, 35)),
  MenuComment('Korean Black Noodle', 'I like it', DateTime(2022, 11, 12, 12, 34)),
  MenuComment('Nagasaki Jjampong', 'I love it', DateTime(2022, 11, 12, 12, 33)),
  MenuComment('Pork Soup', 'Good', DateTime(2022, 11, 12, 12, 32)),
  MenuComment('Rose Pasta', 'I like it', DateTime(2022, 11, 12, 12, 31)),
  MenuComment('Braised Chicken with Cheese', 'Nice', DateTime(2022, 11, 12, 12, 30)),
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
  String restaurantName;
  List<String> operatingTimeTextList;
  int waitingTime;
  int waitingPeople;
  bool isAvailable;

  RestaurantInfo(this.restaurantName, this.operatingTimeTextList, this.waitingTime, this.waitingPeople, this.isAvailable);
}

Map<String, RestaurantInfo> restaurantInfoMap = {
  'Mix Rice' : RestaurantInfo(
    'Mix Rice',
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    8,
    12,
    true,
  ),
  'Korean Table' : RestaurantInfo(
    'Korean Table',
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    -1,
    0,
    false,
  ),
  'H.Plate' : RestaurantInfo(
    'H.Plate',
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    -1,
    0,
    false,
  ),
  'Mom\'s Kitchen' : RestaurantInfo(
    'Mom\'s Kitchen',
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    3,
    8,
    true,
  ),
  'Handong Lounge' : RestaurantInfo(
    'Handong Lounge',
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    -1,
    0,
    false,
  ),
  'Burger King' : RestaurantInfo(
    'Burger King',
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    25,
    25,
    true,
  ),
  'The Grace Table' : RestaurantInfo(
    'The Grace Table',
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    -1,
    0,
    false,
  ),
  'In Breeze (Bokjidong)' : RestaurantInfo(
    'In Breeze (Bokjidong)',
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    24,
    8,
    true,
  ),
  'Red Neoguri' : RestaurantInfo(
    'Red Neoguri',
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    24,
    17,
    true,
  ),
  'Farm\'s Valley' : RestaurantInfo(
    'Farm\'s Valley',
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    21,
    4,
    true,
  ),
  'Han\'s Deli' : RestaurantInfo(
    'Han\'s Deli',
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    16,
    4,
    true,
  ),
  'In Breeze (Papyrus)' : RestaurantInfo(
    'In Breeze (Papyrus)',
    [
      'Mon - Fri 11:00 - 14:00',
      'Mon - Fri 17:00 - 20:00',
      'Sat - Sun 11:00 - 14:00',
      'Sat - Sun 17:00 - 20:00',
    ],
    22,
    5,
    true,
  ),
};

class PostComment {
  int postType;
  int postIndex;
  String commentWriter;
  DateTime commentTime;
  String commentText;

  PostComment(this.postType, this.postIndex, this.commentWriter, this.commentTime, this.commentText);
}

List<PostComment> postCommentList = [
  PostComment(0, 0, 'Person1', DateTime(2022, 10, 25, 9, 32), 'Oh no'),
  PostComment(0, 0, 'Person2', DateTime(2022, 10, 25, 9, 31), 'I\'m hungry'),
  PostComment(0, 0, 'Person3', DateTime(2022, 10, 25, 9, 30), 'I\'m so hungry'),
  PostComment(0, 1, 'Person1', DateTime(2022, 10, 25, 9, 32), 'Oh no'),
  PostComment(0, 1, 'Person2', DateTime(2022, 10, 25, 9, 31), 'I\'m hungry'),
  PostComment(0, 1, 'Person3', DateTime(2022, 10, 25, 9, 30), 'I\'m so hungry'),
  PostComment(0, 2, 'Person1', DateTime(2022, 10, 25, 9, 32), 'Oh no'),
  PostComment(0, 2, 'Person2', DateTime(2022, 10, 25, 9, 31), 'I\'m hungry'),
  PostComment(0, 2, 'Person3', DateTime(2022, 10, 25, 9, 30), 'I\'m so hungry'),
  PostComment(0, 3, 'Person1', DateTime(2022, 10, 25, 9, 32), 'Oh no'),
  PostComment(0, 3, 'Person2', DateTime(2022, 10, 25, 9, 31), 'I\'m hungry'),
  PostComment(0, 3, 'Person3', DateTime(2022, 10, 25, 9, 30), 'I\'m so hungry'),
  PostComment(0, 4, 'Person1', DateTime(2022, 10, 25, 9, 32), 'Oh no'),
  PostComment(0, 4, 'Person2', DateTime(2022, 10, 25, 9, 31), 'I\'m hungry'),
  PostComment(0, 4, 'Person3', DateTime(2022, 10, 25, 9, 30), 'I\'m so hungry'),
  PostComment(0, 5, 'Person1', DateTime(2022, 10, 25, 9, 32), 'Oh no'),
  PostComment(0, 5, 'Person2', DateTime(2022, 10, 25, 9, 31), 'I\'m hungry'),
  PostComment(0, 5, 'Person3', DateTime(2022, 10, 25, 9, 30), 'I\'m so hungry'),
  PostComment(0, 6, 'Person1', DateTime(2022, 10, 25, 9, 32), 'Oh no'),
  PostComment(0, 6, 'Person2', DateTime(2022, 10, 25, 9, 31), 'I\'m hungry'),
  PostComment(0, 6, 'Person3', DateTime(2022, 10, 25, 9, 30), 'I\'m so hungry'),
  PostComment(0, 7, 'Person1', DateTime(2022, 10, 25, 9, 32), 'Oh no'),
  PostComment(0, 7, 'Person2', DateTime(2022, 10, 25, 9, 31), 'I\'m hungry'),
  PostComment(0, 7, 'Person3', DateTime(2022, 10, 25, 9, 30), 'I\'m so hungry'),
  PostComment(0, 8, 'Person1', DateTime(2022, 10, 25, 9, 32), 'Oh no'),
  PostComment(0, 8, 'Person2', DateTime(2022, 10, 25, 9, 31), 'I\'m hungry'),
  PostComment(0, 8, 'Person3', DateTime(2022, 10, 25, 9, 30), 'I\'m so hungry'),
  PostComment(0, 9, 'Person1', DateTime(2022, 10, 25, 9, 32), 'Oh no'),
  PostComment(0, 9, 'Person2', DateTime(2022, 10, 25, 9, 31), 'I\'m hungry'),
  PostComment(0, 9, 'Person3', DateTime(2022, 10, 25, 9, 30), 'I\'m so hungry'),
  PostComment(1, 0, 'Person1', DateTime(2022, 10, 25, 9, 32), 'Oh no'),
  PostComment(1, 0, 'Person2', DateTime(2022, 10, 25, 9, 31), 'I\'m hungry'),
  PostComment(1, 0, 'Person3', DateTime(2022, 10, 25, 9, 30), 'I\'m so hungry'),
  PostComment(1, 1, 'Person1', DateTime(2022, 10, 25, 9, 32), 'Oh no'),
  PostComment(1, 1, 'Person2', DateTime(2022, 10, 25, 9, 31), 'I\'m hungry'),
  PostComment(1, 1, 'Person3', DateTime(2022, 10, 25, 9, 30), 'I\'m so hungry'),
  PostComment(1, 2, 'Person1', DateTime(2022, 10, 25, 9, 32), 'Oh no'),
  PostComment(1, 2, 'Person2', DateTime(2022, 10, 25, 9, 31), 'I\'m hungry'),
  PostComment(1, 2, 'Person3', DateTime(2022, 10, 25, 9, 30), 'I\'m so hungry'),
  PostComment(1, 3, 'Person1', DateTime(2022, 10, 25, 9, 32), 'Oh no'),
  PostComment(1, 3, 'Person2', DateTime(2022, 10, 25, 9, 31), 'I\'m hungry'),
  PostComment(1, 3, 'Person3', DateTime(2022, 10, 25, 9, 30), 'I\'m so hungry'),
  PostComment(1, 4, 'Person1', DateTime(2022, 10, 25, 9, 32), 'Oh no'),
  PostComment(1, 4, 'Person2', DateTime(2022, 10, 25, 9, 31), 'I\'m hungry'),
  PostComment(1, 4, 'Person3', DateTime(2022, 10, 25, 9, 30), 'I\'m so hungry'),
  PostComment(1, 5, 'Person1', DateTime(2022, 10, 25, 9, 32), 'Oh no'),
  PostComment(1, 5, 'Person2', DateTime(2022, 10, 25, 9, 31), 'I\'m hungry'),
  PostComment(1, 5, 'Person3', DateTime(2022, 10, 25, 9, 30), 'I\'m so hungry'),
  PostComment(1, 6, 'Person1', DateTime(2022, 10, 25, 9, 32), 'Oh no'),
  PostComment(1, 6, 'Person2', DateTime(2022, 10, 25, 9, 31), 'I\'m hungry'),
  PostComment(1, 6, 'Person3', DateTime(2022, 10, 25, 9, 30), 'I\'m so hungry'),
  PostComment(1, 7, 'Person1', DateTime(2022, 10, 25, 9, 32), 'Oh no'),
  PostComment(1, 7, 'Person2', DateTime(2022, 10, 25, 9, 31), 'I\'m hungry'),
  PostComment(1, 7, 'Person3', DateTime(2022, 10, 25, 9, 30), 'I\'m so hungry'),
  PostComment(1, 8, 'Person1', DateTime(2022, 10, 25, 9, 32), 'Oh no'),
  PostComment(1, 8, 'Person2', DateTime(2022, 10, 25, 9, 31), 'I\'m hungry'),
  PostComment(1, 8, 'Person3', DateTime(2022, 10, 25, 9, 30), 'I\'m so hungry'),
  PostComment(1, 9, 'Person1', DateTime(2022, 10, 25, 9, 32), 'Oh no'),
  PostComment(1, 9, 'Person2', DateTime(2022, 10, 25, 9, 31), 'I\'m hungry'),
  PostComment(1, 9, 'Person3', DateTime(2022, 10, 25, 9, 30), 'I\'m so hungry'),
];

class AnnouncementPost {
  String writer;
  DateTime date;
  String title;
  String content;

  AnnouncementPost(this.writer, this.date, this.title, this.content);
}

List<AnnouncementPost> announcementPostList = [
  AnnouncementPost(
    'Korean Table',
    DateTime(2022, 10, 25, 8, 30),
    'Korean Table Closed Notice',
    '''Hello, I am the person in charge of Korean Table.
    In the aftermath of the recent sharp rise in agricultural product prices, the supply of ingredients is not smooth, so we will be closed for the time being.
    Thank you for your understanding.''',
  ),
  AnnouncementPost(
    'Handong Lounge',
    DateTime(2022, 10, 17, 12, 30),
    'Holiday Notice',
    '''Hello, Handong students and faculty.
    Please note that our Handong Lounge will be closed during this holiday period.
    thank you''',
  ),
  AnnouncementPost(
    'Korean Table',
    DateTime(2022, 10, 15, 8, 30),
    'Notice of raising prices',
    '''We would like to inform you that we are raising the price of a set meal from 3,300 won to 4,000 won as we are unable to provide high-quality food at the previous price due to the sharp rise in the price of agricultural products.
    Thank you for your understanding.''',
  ),
  AnnouncementPost(
    'Mix Rice',
    DateTime(2022, 10, 10, 10, 30),
    'Notice of Menu Change',
    '''Hello, I am the person in charge of Mix Rice.
    We are changing the menu to a new menu.
    Jjampong -> Nagasaki Jjambbong
    Thank you very much for your interest.''',
  ),
  AnnouncementPost(
    'Writer',
    DateTime(2022, 10, 8, 8, 30),
    'Title',
    '''Content''',
  ),
  AnnouncementPost(
    'Writer',
    DateTime(2022, 10, 8, 8, 30),
    'Title',
    '''Content''',
  ),
  AnnouncementPost(
    'Writer',
    DateTime(2022, 10, 8, 8, 30),
    'Title',
    '''Content''',
  ),
  AnnouncementPost(
    'Writer',
    DateTime(2022, 10, 8, 8, 30),
    'Title',
    '''Content''',
  ),
  AnnouncementPost(
    'Writer',
    DateTime(2022, 10, 8, 8, 30),
    'Title',
    '''Content''',
  ),
  AnnouncementPost(
    'Writer',
    DateTime(2022, 10, 8, 8, 30),
    'Title',
    '''Content''',
  ),
];

class StudentVoicePost {
  String writer;
  DateTime date;
  String title;
  String content;
  int like;
  int dislike;

  StudentVoicePost(this.writer, this.date, this.title, this.content, this.like, this.dislike);
}

List<StudentVoicePost> studentVoicePostList = [
  StudentVoicePost(
    'Person1',
    DateTime(2022, 10, 25, 9, 30),
    'Do you like the pork cutlet that came out today?',
    'I\'m so hungry...',
    5,
    3,
  ),
  StudentVoicePost(
    'Person2',
    DateTime(2022, 10, 25, 9, 31),
    'Would you like to have chicken delivered to us for lunch?',
    'Ttang Ttang Chicken!',
    2,
    5,
  ),
  StudentVoicePost(
    'Person3',
    DateTime(2022, 10, 25, 9, 32),
    'I\'m hungry',
    'I\'m so hungry',
    3,
    2,
  ),
  StudentVoicePost(
    'Person1',
    DateTime(2022, 10, 25, 9, 30),
    'I\'m hungry',
    'I\'m so hungry',
    1,
    5,
  ),
  StudentVoicePost(
    'Person2',
    DateTime(2022, 10, 25, 9, 31),
    'I\'m hungry',
    'I\'m so hungry',
    3,
    3,
  ),
  StudentVoicePost(
    'Person3',
    DateTime(2022, 10, 25, 9, 32),
    'I\'m hungry',
    'I\'m so hungry',
    0,
    3,
  ),
  StudentVoicePost(
    'Person1',
    DateTime(2022, 10, 25, 9, 30),
    'I\'m hungry',
    'I\'m so hungry',
    0,
    0,
  ),
  StudentVoicePost(
    'Person2',
    DateTime(2022, 10, 25, 9, 31),
    'I\'m hungry',
    'I\'m so hungry',
    0,
    0,
  ),
  StudentVoicePost(
    'Person3',
    DateTime(2022, 10, 25, 9, 32),
    'I\'m hungry',
    'I\'m so hungry',
    0,
    0,
  ),
  StudentVoicePost(
    'Person3',
    DateTime(2022, 10, 25, 9, 32),
    'I\'m hungry',
    'I\'m so hungry',
    0,
    0,
  ),
];

class MyEvalForStudentVoicePost {
  bool isLiked = false;
  bool isDisliked = false;
}

List<MyEvalForStudentVoicePost> myEvalForStudentVoicePostList = [
  MyEvalForStudentVoicePost(),
  MyEvalForStudentVoicePost(),
  MyEvalForStudentVoicePost(),
  MyEvalForStudentVoicePost(),
  MyEvalForStudentVoicePost(),
  MyEvalForStudentVoicePost(),
  MyEvalForStudentVoicePost(),
  MyEvalForStudentVoicePost(),
  MyEvalForStudentVoicePost(),
  MyEvalForStudentVoicePost(),
];

List<int> expTable = [0, 25, 50, 100, 200, 300, 400, 500, 600, 700, 1000];

class User {
  String nickname;
  int level;
  int exp;

  User(this.nickname, this.level, this.exp);
}

User myUser = User('nickname', 2, 30);

List<String> myFavoriteMenuList = [
  'Pork Cutlet Kimchi Udon',
  'Samgyetang',
  'Korean Black Noodle'
];
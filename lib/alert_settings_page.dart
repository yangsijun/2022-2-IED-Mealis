import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mealis/database.dart';

class AlertSettingsPage extends StatefulWidget {
  const AlertSettingsPage({Key? key}) : super(key: key);

  @override
  State<AlertSettingsPage> createState() => _AlertSettingsPageState();
}

bool isTodaysMenuOn = false;
TimeOfDay todayMenuAlertTime = TimeOfDay.now();
List<bool> isDayOfWeek = [false, true, true, true, true, true, false];

Widget getDayOfWeekButton(BuildContext context, int index, List<bool> tempIsDayOfWeek) {
  const List<String> dayOfWeek = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          color: tempIsDayOfWeek[index]
            ? Theme.of(context).colorScheme.primaryContainer
            : Theme.of(context).colorScheme.surface,
        ),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () {
            setState(() {
              tempIsDayOfWeek[index] = !tempIsDayOfWeek[index];
            });
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              dayOfWeek[index],
              style: TextStyle(
                color: tempIsDayOfWeek[index]
                    ? Theme.of(context).colorScheme.onSurface
                    : Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      );
    }
  );
}

Future<List<bool>?> showDayOfWeekPicker(BuildContext context) async {
  List<bool> tempIsDayOfWeek = List<bool>.from(isDayOfWeek);
  return showDialog<List<bool>?>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Alert Days',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Select days of the week',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < 7; i++)
                        getDayOfWeekButton(context, i, tempIsDayOfWeek),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, null);
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, tempIsDayOfWeek);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

String getAlertDaysText(BuildContext context) {
  const List<String> dayOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  String alertDays = '';

  for (int i = 0; i < 7; i++) {
    if (isDayOfWeek[i]) {
      if (alertDays != '') {
        alertDays += ', ';
      }
      alertDays += dayOfWeek[i];
    }
  }
  return alertDays;
}

bool isFavoriteMenuOn = false;

Future<String?> showAddFavoriteMenuDialog(BuildContext context) async {
  String menuName = '';
  TextEditingController menuNameController = TextEditingController();
  return showDialog<String?>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(24),
              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Add Favorite Menu',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                Text(
                  'Enter a name for the menu',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: menuNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Menu Name',
                  ),
                  autofocus: true,
                  onChanged: (String value) {
                    menuName = value;
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, null);
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, menuName);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ],
            ),
            );
          },
        ),
      );
    },
  );

}

class _AlertSettingsPageState extends State<AlertSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text('Alert Settings'),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              color: Theme.of(context).colorScheme.surface,
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Today\'s menu'),
                    subtitle: const Text('Turn on/off alerts'),
                    trailing: Switch(
                      value: isTodaysMenuOn,
                      onChanged: (value) {
                        setState(() {
                          isTodaysMenuOn = value;
                        });
                      },
                    ),
                  ),
                  (isTodaysMenuOn)
                  ? Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        Card(
                          child: InkWell(
                              customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: const Text('Alert Time'),
                              subtitle: Text(todayMenuAlertTime.format(context)),
                              trailing: Icon(
                                Icons.edit,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            onTap: () async {
                              TimeOfDay? picked = await showTimePicker(
                                context: context,
                                initialTime: todayMenuAlertTime,
                              );
                              if (picked != null) {
                                setState(() {
                                  todayMenuAlertTime = picked;
                                });
                              }
                            },
                          ),
                        ),
                        Card(
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: const Text('Alert Days'),
                              subtitle: Text(
                                getAlertDaysText(context),
                              ),
                              trailing: Icon(
                                Icons.edit,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            onTap: () async {
                              List<bool>? picked = await showDayOfWeekPicker(context);
                              if (picked != null) {
                                setState(() {
                                  isDayOfWeek = picked;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                  : Container(),
                  ListTile(
                    title: const Text('Favorite Menu'),
                    subtitle: const Text('Turn on/off your favorite menu alerts'),
                    trailing: Switch(
                      value: isFavoriteMenuOn,
                      onChanged: (value) {
                        setState(() {
                          isFavoriteMenuOn = value;
                        });
                      },
                    ),
                  ),
                  (isFavoriteMenuOn)
                  ? Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        Card(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  width: double.infinity,
                                  child: Wrap(
                                    spacing: 10,
                                    children: [
                                      for (int i = 0; i < myFavoriteMenuList.length; i++)
                                        Chip(
                                          label: Text(myFavoriteMenuList[i]),
                                          labelStyle: Theme.of(context).textTheme.labelSmall,
                                          surfaceTintColor: Theme.of(context).colorScheme.onSurfaceVariant,
                                          backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                                          deleteIcon: Icon(
                                            Icons.close,
                                            color: Theme.of(context).colorScheme.onSurface,
                                          ),
                                          onDeleted: () {
                                            setState(() {
                                              myFavoriteMenuList.removeAt(i);
                                            });
                                          },
                                        ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () async {
                                        String? picked = await showAddFavoriteMenuDialog(context);
                                        if (picked != null) {
                                          setState(() {
                                            myFavoriteMenuList.add(picked);
                                          });
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                                        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                                      ),
                                      child: Row(
                                        children: const [
                                          Icon(Icons.add),
                                          SizedBox(width: 5),
                                          Text('Add'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // child: InkWell(
                          //     customBorder: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(10),
                          //   ),
                          //   child: ListTile(
                          //     title: const Text('Alert Time'),
                          //     subtitle: Text(todayMenuAlertTime.format(context)),
                          //     trailing: Icon(
                          //       Icons.edit,
                          //       color: Theme.of(context).colorScheme.onSurface,
                          //     ),
                          //   ),
                          //   onTap: () async {
                          //     TimeOfDay? picked = await showTimePicker(
                          //       context: context,
                          //       initialTime: todayMenuAlertTime,
                          //     );
                          //     if (picked != null) {
                          //       setState(() {
                          //         todayMenuAlertTime = picked;
                          //       });
                          //     }
                          //   },
                          // ),
                        ),
                      ],
                    ),
                  )
                  : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
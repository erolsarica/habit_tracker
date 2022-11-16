import 'package:flutter/material.dart';

import '../components/habit_tile.dart';
import 'package:habit_tracker/components/my_fab.dart';

import '../components/my_alert_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // data structure for todays list
  List todaysHabitList = [
    // [ habitName, habitComplated ]
    ["Morning Run", false],
    ["Read Book", false],
    ["Code App", false],
  ];

  // checkbox was tapped
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      todaysHabitList[index][1] = value;
    });
  }

  // create a new habit
  final _newHabitNameController = TextEditingController();
  void createNewHabit() {
    // show alert dialog for user to enter the new habit details
    showDialog(
        context: context,
        builder: (context) {
          return MyAlertBox(
            controller: _newHabitNameController,
            onSave: saveNewHabit,
            onCancel: cancelDialogBox,
          );
        }
        );
  }

  // save new habit
  void saveNewHabit(){
    // add new habit to todays habit list
    setState(() {
      todaysHabitList.add([_newHabitNameController.text,false]);
    });


    // clear textfield
    _newHabitNameController.clear();
    // pop dialog box
    Navigator.of(context).pop();

  }

  // cancel new habit
  void cancelDialogBox(){
    // clear textfield
    _newHabitNameController.clear();
    // pop dialog box
    Navigator.of(context).pop();
  }

  // open habit settings to edit
  void openHabitSettings(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
            controller: _newHabitNameController,
            onSave: () => saveExistingHabit(index),
            onCancel: cancelDialogBox,
        );
    },
    );
  }

  // save existing habit with a new name
  void saveExistingHabit(int index) {

    setState(() {
      todaysHabitList[index][0] = _newHabitNameController.text;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: MyFloatingActionButton(onPressed: createNewHabit,),
      body: ListView.builder(
        itemCount: todaysHabitList.length,
        itemBuilder: (context, index) {
          return HabitTile(
              habitName: todaysHabitList[index][0],
              habitComplated: todaysHabitList[index][1],
              onChanged: (value) => checkBoxTapped(value, index),
              settingsTapped: (context) => openHabitSettings,
              deleteTapped: (BuildContext ) {  },
          );
        },

      ),


    );
  }
}

//15.26

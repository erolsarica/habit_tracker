import 'package:flutter/material.dart';

import '../components/habit_tile.dart';
import 'package:habit_tracker/components/my_fab.dart';

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
  void createNewHabit() {


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: MyFloatingActionButton(),
      body: ListView.builder(
        itemCount: todaysHabitList.length,
        itemBuilder: (context, index) {
          return HabitTile(
              habitName: todaysHabitList[index][0],
              habitComplated: todaysHabitList[index][1],
              onChanged: (value) => checkBoxTapped(value, index),
          );
        },

      ),


    );
  }
}

//6.10

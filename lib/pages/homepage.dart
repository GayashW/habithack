import 'package:flutter/material.dart';
import 'package:habithack/data/database.dart';
import 'package:habithack/utils/theme/theme_Notifier.dart';
import 'package:habithack/utils/widgets/dialogBox.dart';
import 'package:habithack/utils/widgets/taskTile.dart';
import 'package:habithack/utils/widgets/todayDetails.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // If box is app for the first time, then create a database
    if (_myBox.get("TASKLIST") == null) {
      db.createInitialData();
    } else {
      // Get the data from the database
      db.loadData();
    }
    super.initState();
  }

  // Reference the hive box
  final _myBox = Hive.box("tasks");
  TaskDatabase db = TaskDatabase();

  // Text controller
  final _controller = TextEditingController();

  // Checkbox clicked to update task completion
  void checkboxClicked(int index, bool taskCompleted) {
    setState(() {
      db.tasksList[index][1] = taskCompleted;
    });
    db.updateData();
    db.recordCompletedTasks(DateTime.now());
    print(db.completedTasksPerDay);
    print(db.tasksCompletedCount);
  }

  // Delete task
  void deleteTask(int index) {
    setState(() {
      db.tasksList.removeAt(index); // Remove task from list
    });
    db.updateData();
  }

  // Save new task
  void saveNewTask() {
    setState(() {
      db.tasksList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  // Create a new task
  void createNewTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return MyDialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }
  // appBar: AppBar(
  //         automaticallyImplyLeading: false,
  //         title: const Center(
  //           child: Text(
  //             'Progress',
  //             style: TextStyle(
  //               fontFamily: "Poppins",
  //               fontSize: 20,
  //             ),
  //           ),
  //         ),
  //       ),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => createNewTask(context),
          elevation: 0, // Pass context here
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Datedetails(
                      selectedDate: DateTime.now(),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: db.tasksList.length,
                  itemBuilder: (context, i) {
                    return TaskTile(
                      taskName: db.tasksList[i][0],
                      taskCompleted: db.tasksList[i][1],
                      onChanged: (bool? newStatus) {
                        if (newStatus != null) {
                          checkboxClicked(
                              i, newStatus); // Update task completion status
                        }
                      },
                      deleteFunction: (BuildContext context) {
                        deleteTask(i); // Delete task by passing the index
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

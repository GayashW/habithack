import 'package:flutter/material.dart';
import 'package:habithack/utils/widgets/dialogBox.dart';
import 'package:habithack/utils/widgets/taskTile.dart';
import 'package:habithack/utils/widgets/todayDetails.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // List of tasks
  List<Map<String, dynamic>> tasks = [
    {
      'taskName': 'Google 1',
      'taskCompleted': false,
    },
    {
      'taskName': 'Task 2',
      'taskCompleted': true,
    },
  ];

  // Checkbox clicked to update task completion
  void checkboxClicked(int index, bool taskCompleted) {
    setState(() {
      tasks[index]['taskCompleted'] = taskCompleted;
    });
  }

  // Delete task
  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index); // Remove task from list
    });
  }

  // Text controller
  final _controller = TextEditingController();

  // Create a new task
  void createNewTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return MyDialogBox(
          controller: _controller,
          onSave: () {},
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNewTask(context),
        elevation: 0, // Pass context here
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          children: [
            Row(
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
                itemCount: tasks.length,
                itemBuilder: (context, i) {
                  return TaskTile(
                    taskName: tasks[i]['taskName'],
                    taskCompleted: tasks[i]['taskCompleted'],
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
      ),
    );
  }
}

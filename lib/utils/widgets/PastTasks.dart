import 'package:flutter/material.dart';
import 'package:habithack/data/database.dart';
import 'package:habithack/utils/widgets/tasklist.dart';
import 'package:hive/hive.dart';

class MyWidget extends StatefulWidget {
  final DateTime selectedDate;

  MyWidget({super.key, required this.selectedDate});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  // Reference the Hive box
  final _myBox = Hive.box("tasks");
  TaskDatabase db = TaskDatabase();

  @override
  void initState() {
    super.initState();
    // Initialize the database
    if (_myBox.get("TASKSBYDATE") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the tasks for the selected date
    List<String> tasksForSelectedDate =
        db.completedTasksPerDay[widget.selectedDate] ?? [];

    return Expanded(
      child: ListView.builder(
        itemCount: tasksForSelectedDate.length,
        itemBuilder: (context, i) {
          final taskName = tasksForSelectedDate[i];
          return TaskList(
            taskName: taskName,
            taskCompleted: true, // These tasks are marked completed
            onChanged: (bool? newStatus) {
              if (newStatus != null && !newStatus) {
                // Handle unchecking the task (move it out of completed)
              }
            },
          );
        },
      ),
    );
  }
}

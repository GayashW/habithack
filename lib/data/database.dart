import 'package:hive/hive.dart';

class TaskDatabase {
  List tasksList = [];
  Map<DateTime, List<String>> completedTasksPerDay =
      {}; // To backtrack tasks per day
  Map<DateTime, int> tasksCompletedCount = {}; // To visualize heatmap

  // Reference Hive box
  final _myBox = Hive.box("Tasks");

  // Create initial data
  void createInitialData() {
    tasksList = [
      ["Make Exercise", false],
      ["Do Workout", false],
    ];
    completedTasksPerDay = {};
    tasksCompletedCount = {};
  }

  // Load data from database
  void loadData() {
    tasksList = _myBox.get("TASKLIST") ?? [];
    completedTasksPerDay =
        Map<DateTime, List<String>>.from(_myBox.get("TASKSBYDATE") ?? {});
    tasksCompletedCount =
        Map<DateTime, int>.from(_myBox.get("TASKCOUNTS") ?? {});
  }

  // Update data
  void updateData() {
    _myBox.put("TASKLIST", tasksList);
    _myBox.put("TASKSBYDATE", completedTasksPerDay);
    _myBox.put("TASKCOUNTS", tasksCompletedCount);
  }

  // Record completed tasks for a specific day
  void recordCompletedTasks(DateTime date) {
    // Normalize the date to midnight (ignoring time)
    final normalizedDate = DateTime(date.year, date.month, date.day);

    // Extract task names of completed tasks
    List<String> completedTaskNames = tasksList
        .where((task) => task[1] == true) // task[1] is the completion status
        .map((task) => task[0] as String) // Extract task names (task[0])
        .toList();

    // Store the completed task names for this specific day
    completedTasksPerDay[normalizedDate] = completedTaskNames;

    // Update the count of completed tasks
    tasksCompletedCount[normalizedDate] = completedTaskNames.length;

    // Update data to persist changes
    updateData();
  }
}

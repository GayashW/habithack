import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;

  TaskList({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: taskCompleted
              ? Theme.of(context).primaryColor.withOpacity(0.5)
              : Theme.of(context).primaryColor.withOpacity(0.2),
        ),
        child: Row(
          children: [
            Checkbox(
              activeColor: Theme.of(context).primaryColor,
              value: taskCompleted,
              onChanged: onChanged,
            ),
            // Task Name with decoration based on completion
            Text(
              taskName,
              style: TextStyle(
                decoration: taskCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

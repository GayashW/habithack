import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  TaskTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) =>
                  deleteFunction?.call(context),
              icon: Icons.delete,
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? const Color(0xFFFF5959)
                  : const Color.fromARGB(101, 255, 89, 89),
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: taskCompleted
                ? Theme.of(context).primaryColor.withOpacity(0.75)
                : Theme.of(context).primaryColor.withOpacity(0.25),
          ),
          child: Row(
            children: [
              // Checkbox for task completion
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:habithack/data/database.dart';
import 'package:habithack/utils/widgets/heatMap.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _DashbordPageState();
}

class _DashbordPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    final TaskDatabase db = TaskDatabase();
    db.loadData();
    return Scaffold(
      body: SingleChildScrollView(
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomHeatMap(
                datasets: db.tasksCompletedCount,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

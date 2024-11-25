import 'package:flutter/material.dart';
import 'package:habithack/data/database.dart';
import 'package:habithack/utils/widgets/heatmap.dart';

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomHeatMap(
              datasets: db.tasksCompletedCount,
            ),
          ],
        ),
      ),
    );
  }
}

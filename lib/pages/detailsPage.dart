import 'package:flutter/material.dart';
import 'package:habithack/utils/widgets/PastTasks.dart';
import 'package:habithack/utils/widgets/todayDetails.dart';

class DetailsPage extends StatelessWidget {
  final DateTime selectedDate;

  // Normalize the date to midnight
  DateTime normalizeDate(DateTime selectedDate) {
    return DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
  }

  const DetailsPage({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // title: const Text(
        //   'Details Page',
        //   style: TextStyle(
        //     fontFamily: "Poppins",
        //     fontSize: 20,
        //   ),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Datedetails(selectedDate: normalizeDate(selectedDate)),
            const SizedBox(
              height: 10,
            ),
            MyWidget(selectedDate: (selectedDate)), // Pass normalized date here
          ],
        ),
      ),
    );
  }
}

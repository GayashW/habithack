import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class CustomHeatMap extends StatelessWidget {
  final Map<DateTime, int> datasets;

  const CustomHeatMap({super.key, required this.datasets});

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime.now(); // Fixed date for testing

    // Calculate the day of week (0 = Sunday, 6 = Saturday)
    int dayOfWeek = today.weekday % 7;

    // Calculate days to subtract to reach the start date
    int daysToSubtract = 0;

    // Align the current date to be in the 4th column (Wednesday)
    switch (dayOfWeek) {
      case 0: // Sunday
        daysToSubtract = 21; // 3 weeks + 3 days
        break;
      case 1: // Monday
        daysToSubtract = 22; // 3 weeks + 4 days
        break;
      case 2: // Tuesday
        daysToSubtract = 23; // 3 weeks + 5 days
        break;
      case 3: // Wednesday
        daysToSubtract = 24; // 3 weeks exactly
        break;
      case 4: // Thursday
        daysToSubtract = 25; // 3 weeks + 1 day
        break;
      case 5: // Friday
        daysToSubtract = 26; // 3 weeks + 2 days
        break;
      case 6: // Saturday
        daysToSubtract = 27; // 3 weeks + 3 days
        break;
    }

    final DateTime startDate = today.subtract(Duration(days: daysToSubtract));
    final DateTime endDate =
        startDate.add(const Duration(days: 34)); // 5 weeks total

    int sum =
        datasets.values.fold(0, (previous, current) => previous + current);

    // Print the start date, day of the week and dataset for debugging
    print(startDate);
    print(dayOfWeek);
    print(datasets);

    // ignore: prefer_const_constructors
    return HeatMap(
      datasets: sum == 0 ? {} : datasets,
      // If datasets is null, use an empty map
      defaultColor: Theme.of(context).colorScheme.secondary.withAlpha(128),
      textColor: Theme.of(context).colorScheme.onSecondary,
      fontSize: 14,
      size: 40,
      margin: const EdgeInsets.all(2),
      startDate: startDate,
      endDate: endDate,
      colorMode: ColorMode.opacity,
      showColorTip: false,
      showText: true,
      colorsets: {
        1: Theme.of(context).primaryColor.withAlpha(50),
        2: Theme.of(context).primaryColor.withAlpha(100),
        3: Theme.of(context).primaryColor.withAlpha(100),
        4: Theme.of(context).primaryColor.withAlpha(150),
        5: Theme.of(context).primaryColor.withAlpha(200),
        6: Theme.of(context).primaryColor.withAlpha(255),
      },
      // onClick: (value) {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => DetailsPage(selectedDate: value),
      //     ),
      //   );
      // },
    );
  }
}

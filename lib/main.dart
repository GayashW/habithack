import 'package:flutter/material.dart';
import 'package:habithack/pages/homepage.dart';
import 'package:habithack/pages/main_Dashboard.dart';
import 'package:habithack/utils/theme/theme_Notifier.dart';
import 'package:habithack/utils/theme/light_mode.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensures all bindings are initialized

  // Initialize Hive
  await Hive.initFlutter();

  // Open a Hive box with error handling
  var box;
  try {
    box = await Hive.openBox("Tasks");
  } catch (e) {
    debugPrint("Error opening Hive box: $e");
  }

  // Check if Hive box is initialized
  if (box == null) {
    debugPrint("Hive box initialization failed. Please check your setup.");
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'HabitHack',
          theme: ThemeDataModes().lightTheme, // Light theme data
          darkTheme: ThemeDataModes().darkTheme, // Dark theme data
          themeMode: themeNotifier.isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light, // Toggle theme based on state
          home: const MainDashboard(), // Main dashboard as home screen
        );
      },
    );
  }
}

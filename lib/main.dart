import 'package:flutter/material.dart';
import 'package:habithack/pages/main_Dashboard.dart';
import 'package:habithack/utils/theme/light_mode.dart';
import 'package:habithack/utils/theme/theme_Notifier.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  //init hive
  await Hive.initFlutter();

  //open a box
  var box = await Hive.openBox("Tasks");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ThemeNotifier()), // Providing ThemeNotifier
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
      // Listen for ThemeNotifier updates
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeDataModes().lightTheme, // Light Theme
          darkTheme: ThemeDataModes().darkTheme, // Dark Theme
          themeMode: themeNotifier.isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light, // Use the state of ThemeNotifier
          home: const MainDashboard(),
        );
      },
    );
  }
}

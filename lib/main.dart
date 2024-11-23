import 'package:flutter/material.dart';
import 'package:habithack/pages/main_Dashboard.dart';
import 'package:habithack/utils/theme/light_mode.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //init hive
  await Hive.initFlutter();

  //open a box
  var box = await Hive.openBox("Tasks");

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeDataModes().darkTheme,
      home: const SafeArea(child: MainDashboard()),
    );
  }
}

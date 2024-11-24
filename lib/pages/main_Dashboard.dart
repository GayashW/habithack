// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:habithack/pages/homepage.dart';
import 'package:habithack/pages/progressPage.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  final PageController _pageController = PageController();
  int selectedPage = 0;

  void onPageChange(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  void onItemTapped(int index) {
    setState(() {
      selectedPage = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChange,
        children: const [
          Homepage(),
          ProgressPage(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: GNav(
          selectedIndex: selectedPage,
          onTabChange: onItemTapped,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          rippleColor: Theme.of(context).colorScheme.onPrimary,
          hoverColor: Colors.grey[100]!,
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: Theme.of(context).primaryColor,
          activeColor: Theme.of(context).colorScheme.onPrimary,
          gap: 10,
          color: Theme.of(context).colorScheme.primary,
          tabs: [
            GButton(
              icon: Icons.today,
              text: "Today",
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            GButton(
              icon: Icons.bar_chart_rounded,
              text: "Progress",
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

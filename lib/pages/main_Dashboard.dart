// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:habithack/pages/homepage.dart';
import 'package:habithack/pages/progressPage.dart';
import 'package:habithack/utils/theme/theme_Notifier.dart';
import 'package:provider/provider.dart';

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
      selectedPage = index; // Update selected page
    });
  }

  void onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut, // Smooth page transition
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            // Empty box to take up space before the title
            SizedBox(width: 40), // Adjust width as needed
            Expanded(
              child: Center(
                child: Text(
                  'Lets Habit_It',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          // Toggle button to change theme
          IconButton(
            onPressed: () {
              // Toggle the theme when the button is pressed
              Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
            },
            icon: Icon(
              // Change icon based on the current theme
              Provider.of<ThemeNotifier>(context).isDarkMode
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChange,
        physics: const BouncingScrollPhysics(), // Optional: smoother scroll
        children: const [
          Homepage(),
          ProgressPage(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: GNav(
          selectedIndex: selectedPage,
          onTabChange: (index) {
            onItemTapped(index); // Synchronize with PageView
          },
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

import 'package:flutter/material.dart';
import 'package:task1/UI/remaining_screen.dart';
import 'package:task1/UI/home_screen.dart';
import 'package:task1/widget/custom_bottom_navigation_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  bool circleProgress = false;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const AnotherScreen(title: 'Portfolio',),
    const AnotherScreen(title: 'More',),
    const AnotherScreen(title: 'Prices',),
    const AnotherScreen(title: 'Settings',),
  ];

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:sitimaryam_19552011050/screens/dashboard_screen.dart';
import 'package:sitimaryam_19552011050/screens/date_picker.dart';
import 'package:sitimaryam_19552011050/screens/time_picker.dart';

class Navybar extends StatefulWidget {
  const Navybar({Key? key}) : super(key: key);

  @override
  _NavybarState createState() => _NavybarState();
}

class _NavybarState extends State<Navybar> {
  int _selectedindex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedindex = index;
            });
          },
          children: [DashboardScreen(), DatePicker(), TimePicker()],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedindex,
        onItemSelected: (index) {
          setState(() {
            _selectedindex = index;
          });
          _pageController.jumpToPage(index);
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.blueAccent,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.date_range),
            title: Text('Date'),
            activeColor: Colors.redAccent,
            inactiveColor: Colors.redAccent,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.timer),
            title: Text('Time'),
            activeColor: Colors.greenAccent,
            inactiveColor: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
}

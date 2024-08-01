import 'package:flutter/material.dart';
import 'package:vikn_task/pages/dashboard.dart';
import 'package:vikn_task/pages/profile.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int pageIndex = 0;
  final List<Widget> _tablist = [
    const Dashboard(),
    const Dashboard(),
    const Dashboard(),
    const Profile(),
  ];

  Widget _buildIcon(IconData icon, int index) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: pageIndex == index ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2A),
      body: Stack(
        children: [
          _tablist.elementAt(pageIndex),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              child: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: _buildIcon(
                        Icons.home_outlined,
                        0,
                      ),
                      label: '•',
                      backgroundColor: Colors.black),
                  BottomNavigationBarItem(
                      icon: _buildIcon(Icons.telegram_outlined, 1),
                      label: '•',
                      backgroundColor: Colors.black),
                  BottomNavigationBarItem(
                      icon:
                          _buildIcon(Icons.notification_important_outlined, 2),
                      label: '•',
                      backgroundColor: Colors.black),
                  BottomNavigationBarItem(
                      icon: _buildIcon(Icons.person_outline_outlined, 3),
                      label: '•',
                      backgroundColor: Colors.black),
                ],
                currentIndex: pageIndex,
                unselectedItemColor: Colors.black,
                showSelectedLabels: true,
                selectedFontSize: 20,
                showUnselectedLabels: false,
                backgroundColor: Colors.black,
                onTap: (int index) {
                  if (index == 0 || index == 3) {
                    setState(() {
                      pageIndex = index;
                    });
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

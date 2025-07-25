import 'package:bookfilim/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:bookfilim/home.dart';
import 'package:bookfilim/explorescreen.dart';
import 'package:bookfilim/tvshowscreen.dart';
import 'package:bookfilim/downloads.dart';
import 'package:bookfilim/details.dart'; // if you're using this later

class Bottomtab extends StatefulWidget {
  const Bottomtab({super.key});

  @override
  State<Bottomtab> createState() => _BottomtabState();
}

class _BottomtabState extends State<Bottomtab> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Home(),
    ExploreScreen(),
    TvShowsScreen(),
    DownloadsScreen(),
    ProfileScreen()
  ];

  final gradientColors = [
    const Color(0xFF1A54FF),
    const Color(0xFFD702FB),
  ];

  @override
  Widget build(BuildContext context) {
    final icons = [
      'asset/image/home.png',
      'asset/image/explore.png',
      'asset/image/tv.png',
      'asset/image/download.png',
      'asset/image/profile.png',
    ];

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: GNav(
            gap: 6,
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            color: Colors.grey[700],
            activeColor: Colors.white,
            tabBackgroundColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            tabs: List.generate(5, (index) {
              final isSelected = _selectedIndex == index;

              return GButton(
                icon: Icons.circle, // Dummy placeholder icon
                iconColor: Colors.transparent,
                iconActiveColor: Colors.transparent,
                iconSize: 0,
                leading: Image.asset(
                  icons[index],
                  width: 24,
                  height: 24,
                  color: isSelected ? Colors.white : Colors.grey[700],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                textColor: isSelected ? Colors.white : Colors.grey[700],
                backgroundGradient: isSelected
                    ? LinearGradient(
                        colors: gradientColors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                borderRadius: BorderRadius.circular(12),
              );
            }),
          ),
        ),
      ),
    );
  }
}

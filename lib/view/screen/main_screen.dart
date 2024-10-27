import 'package:flutter/material.dart';
import 'package:mike_test_app/view/screen/nav/favorite_screen.dart';
import 'package:mike_test_app/view/screen/nav/home_screen.dart';

import 'nav/account_screen.dart';
import 'nav/song_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // const MainScreen({super.key});
  int _pageIndex = 0;

  // Define your pages here
  final List<Widget> _pages = [
    const HomeScreen(),
    const FavoriteScreen(),
    const SongScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: _pageIndex,
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Songs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ]),
        body: _pages[_pageIndex],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/pages/settings_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final List _pages = [ 
    HomePage(),
    ProfilePage(),
    SettingsPage()
  ];

  int _set_index = 0;

  void _changePages(int index) {
    setState(() {
      _set_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("First Page", style: TextStyle(color: Colors.white)),
      ),
      body: _pages[_set_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _set_index,
        onTap: _changePages,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'PROFILE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'SETTINGS',
          )
        ],
      ),
    );
  }
}
// ignore_for_file: unused_element, file_names, camel_case_types, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hospitalxyz/src/pages/student.dart';
import 'package:hospitalxyz/src/pages/surgery.dart';
import 'package:hospitalxyz/src/pages/work.dart';
import 'package:hospitalxyz/src/pages/user.dart';
import 'package:hospitalxyz/src/pages/homePage.dart';

const TextStyle _textStyle = TextStyle(
  fontSize: 36,
  fontWeight: FontWeight.bold,
  letterSpacing: 0,
  fontStyle: FontStyle.italic,
);

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  int _currentIndex = 0;
  static List<Widget> pages = [
    HomePage(),
    StudentList(),
    Surgery(),
    PatientList(),
    DoctorList(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: SafeArea(
        child: pages.elementAt(_currentIndex),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.white.withOpacity(0.5),
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        child: NavigationBar(
          backgroundColor: Color.fromARGB(255, 0, 191, 255),
          animationDuration: const Duration(seconds: 1),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          height: 60,
          selectedIndex: _currentIndex,
          onDestinationSelected: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.medical_services),
              icon: Icon(Icons.medical_services_outlined),
              label: 'Alunos',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.av_timer),
              icon: Icon(Icons.av_timer_outlined),
              label: 'Cirurgias',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.eco),
              icon: Icon(Icons.eco_outlined),
              label: 'Pacientes',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person),
              icon: Icon(Icons.person_outlined),
              label: 'Médicos',
            ),
          ],
        ),
      ),
    );
  }
}

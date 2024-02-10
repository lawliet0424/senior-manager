import 'package:flutter/material.dart';
import 'package:knockknock/color.dart';
import 'package:knockknock/manager/manager/m_components/m_nav_bar.dart';
import 'package:knockknock/manager/manager/nav1_message/m_message_initial.dart';
import 'package:knockknock/manager/manager/nav2_todo/m_todo_initial.dart';
import 'package:knockknock/manager/manager/nav3_home/m_home_initial.dart';
import 'package:knockknock/manager/manager/nav4_location/m_location_initial.dart';
import 'package:knockknock/manager/manager/nav5_menu/m_menu_initial.dart';

class ManagerInitial extends StatefulWidget {
  const ManagerInitial({super.key});

  @override
  State<ManagerInitial> createState() => _ManagerInitialState();
}

class _ManagerInitialState extends State<ManagerInitial> {
  int _selectedIndex = 2;

  final List<Widget> _navIndex = [
    const ManagerMessageInitial(),
    const ManagerTodoInitial(),
    const ManagerHomeInitial(),
    const ManagerLocationInitial(),
    const ManagerMenuInitial(),
  ];

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: MyColor.myBackground,
        body: _navIndex.elementAt(_selectedIndex),
        bottomNavigationBar: ManagerNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onNavTapped,
        ),
      ),
    );
  }
}

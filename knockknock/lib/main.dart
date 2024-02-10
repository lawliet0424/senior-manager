import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'package:knockknock/manager/login_signup/i_login.dart';
import 'package:knockknock/manager/manager/manager_initial.dart';
import 'package:knockknock/senior/screen/emergency_2_senior.dart';
import 'package:knockknock/senior/screen/emergency_senior.dart';
import 'package:knockknock/senior/screen/home_senior.dart';
import 'package:knockknock/senior/screen/profile_senior.dart';
import 'package:knockknock/senior/screen/record_senior.dart'; //record_administer로 바꾸면 관리자용 메시지화면 확인 가능
import 'package:knockknock/senior/screen/response_2_senior.dart';
import 'package:knockknock/senior/screen/response_senior.dart';
import 'package:knockknock/senior/component/my_bottomnavigationbar.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const KnockKnock());
}

class KnockKnock extends StatefulWidget {
  const KnockKnock({Key? key}) : super(key: key);

  @override
  State<KnockKnock> createState() => _KnockKnockState();
}

class _KnockKnockState extends State<KnockKnock> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}

class SeniorMain extends StatefulWidget {
  const SeniorMain({Key? key}) : super(key: key);

  @override
  State<SeniorMain> createState() => _SeniorMainState();
}

class _SeniorMainState extends State<SeniorMain> {
  int _selectedIndex = 1;

  final List<Widget> _navIndex = [
    const RecordPage(),
    const HomePage(),
    const EmergencyPage(),
  ];

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      left: false,
      bottom: false,
      right: false,
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: const Color(0xffEDEDF4),
          body: _navIndex.elementAt(_selectedIndex),
          bottomNavigationBar: MyBottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onNavTapped,
          ),
        ),
        routes: {
          '/home': (context) => const HomePage(),
          '/response': (context) => const ResponsePage(),
          '/response_2': (context) => const ResponseCompletePage(),
          '/record': (context) => const RecordPage(),
          '/emergency': (context) => const EmergencyPage(),
          '/emergency_2': (context) => const EmergencyCompletePage(),
          '/profile': (context) => const SeniorProfile(),
        },
      ),
    );
  }
}

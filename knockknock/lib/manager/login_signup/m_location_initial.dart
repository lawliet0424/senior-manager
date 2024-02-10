import 'package:flutter/material.dart';
import 'package:knockknock/color.dart';
import 'package:knockknock/manager/manager/m_components/m_app_bar.dart';

import 'package:knockknock/manager/manager/nav1_message/m_otherside_chatbox.dart';

class ManagerLocationInitial extends StatelessWidget {
  const ManagerLocationInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: MyColor.myBackground,
        appBar: ManagerAppBar(
          title: '위치',
          size: 95,
        ),
        body: Column(
          children: [
            OtherSideChatBox(
              name: "name",
              profile: "assets/images/user_profile.jpg",
              message: "잘 지내시나요?",
              time: "time",
            ),
          ],
        ));
  }
}

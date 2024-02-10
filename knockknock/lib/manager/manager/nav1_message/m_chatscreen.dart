import 'package:flutter/material.dart';
import 'package:knockknock/color.dart';
import 'package:knockknock/manager/manager/m_components/m_app_bar.dart';

import 'package:knockknock/manager/manager/nav1_message/m_myside_chatbox.dart';
import 'package:knockknock/manager/manager/nav1_message/m_otherside_chatbox.dart';

class ManagerChatscreen extends StatefulWidget {
  const ManagerChatscreen({super.key});

  @override
  State<ManagerChatscreen> createState() => _ManagerChatscreenState();
}

class _ManagerChatscreenState extends State<ManagerChatscreen> {
  final List<String> messages = [
    'test',
    '약 드셨나요?',
    'Hello World',
    'test',
    '약 드셨나요?',
    'Hello World',
    'test',
    '약 드셨나요?',
    'Hello World'
  ];

  final List<String> timestamps = [
    "2024년 2월 9일 13시 20분",
    "2024년 2월 9일 13시 20분",
    "2024년 2월 9일 13시 20분",
    "2024년 2월 9일 13시 20분",
    "2024년 2월 9일 13시 20분",
    "2024년 2월 9일 13시 20분",
    "2024년 2월 9일 13시 20분",
    "2024년 2월 9일 13시 20분",
    "2024년 2월 9일 13시 20분",
  ];

  final List<bool> isMe = [
    false,
    true,
    true,
    false,
    true,
    false,
    false,
    true,
    false
  ];

  final List<bool> isReply = [
    false,
    true,
    true,
    false,
    false,
    false,
    false,
    true,
    false,
  ];

  late ScrollController _scrollController;
  bool isWarning = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    checkIsWarning();
  }

  void checkIsWarning() {
    if (isReply.contains(false)) {
      setState(() {
        isWarning = true;
      });
    } else {
      setState(() {
        isWarning = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.myBackground,
      appBar: const ManagerAppBar(
        size: 80,
      ),
      bottomNavigationBar: Container(
        color: MyColor.myBackground,
        height: 100,
        child: Center(
          child: Text(
            isWarning ? "경고! 대답없는 문 두드리기가 있습니다" : "정상 상태입니다.",
            style: TextStyle(
              fontSize: isWarning ? 28 : 25,
              color: isWarning ? MyColor.myRed : MyColor.myBlack,
              fontWeight: isWarning ? FontWeight.w800 : FontWeight.w400,
            ),
          ),
        ),
      ),
      body: Scrollbar(
        controller: _scrollController,
        trackVisibility: true,
        thumbVisibility: true,
        thickness: 5,
        radius: const Radius.circular(20),
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 9,
          itemBuilder: (context, index) {
            if (isMe[index]) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: MySideChatBox(
                  message: messages[index],
                  time: timestamps[index].split(' ').sublist(3).join(' '),
                  isReply: isReply[index],
                ),
              );
            } else {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: OtherSideChatBox(
                  name: "name",
                  message: messages[index],
                  time: timestamps[index].split(' ').sublist(3).join(' '),
                  profile: "assets/images/user_profile.jpg",
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:knockknock/senior/component/my_appbar.dart';
// import 'package:test/component/my_appbar.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({super.key});
  void onLogout() {}
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: const MyAppBar(
          myLeadingWidth: 130,
        ),
        body: MaterialApp(
          home: ChatScreen(),
        ));
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<String> _messages = ['test', '약 드셨나요?', 'Hello World'];
  final List<String> _timestamps = [
    DateTime.utc(1944, 6, 6).toString(),
    DateTime.utc(1944, 6, 6).toString(),
    DateTime.utc(1944, 6, 6).toString(),
  ];

  Widget _OpposingMessageWidget(String message, String timestamp, bool isMe) {
    final textColor = isMe ? Colors.white : Colors.black;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 20,
          height: 20,
        ),
        Column(children: [
          SizedBox(
            height: 60,
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/basic_profile.png'),
            radius: 25, // 프로필 이미지 반지름
          ),
          Text('김노인', style: TextStyle(color: Colors.black)),
        ]),
        Column(
          children: [
            //메시지 박스
            SizedBox(
              height: 20,
            ),
            Container(
                //송수신 시간
                alignment: Alignment.centerLeft,
                margin:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                child: Text(
                  timestamp,
                  style: const TextStyle(color: Colors.black),
                )),
            Container(
              width: 220,
              height: 100,
              margin:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              padding: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(message, style: TextStyle(color: textColor)),
            ),
          ],
        )
      ],
    );
  }

  Widget _MyMessageWidget(String message, String timestamp, bool isMe) {
    final textColor = isMe ? Colors.white : Colors.black;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        //메시지 박스
        SizedBox(
          width: 70,
        ),
        Column(
          children: [
            SizedBox(
              height: 20,
            ),
            //송수신 시간
            Container(
                alignment: Alignment.centerLeft,
                margin:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                child: Text(
                  timestamp,
                  style: const TextStyle(color: Colors.black),
                )),

            Container(
              width: 220,
              height: 100,
              margin:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              padding: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                color: const Color(0x3475EB).withOpacity(1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(message, style: TextStyle(color: textColor)),
            ),
          ],
        ),
        //프로필 이미지+이름
        Column(children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/basic_profile.png'),
            radius: 25, // 프로필 이미지 반지름
          ),
          Text('김관리자', style: TextStyle(color: Colors.black)),
          SizedBox(
            height: 20,
          ),
        ]),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isMe = Random().nextBool();
    return Scaffold(
      body: Container(
        width: 393,
        height: 800,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Color(0xffEDEDF4)),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  isMe = Random().nextBool();
                  if (isMe) {
                    return _MyMessageWidget(
                        _messages[index], _timestamps[index], isMe);
                  } else {
                    return _OpposingMessageWidget(
                        _messages[index], _timestamps[index], isMe);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

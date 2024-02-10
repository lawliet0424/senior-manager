import 'package:flutter/material.dart';
import 'package:knockknock/senior/component/my_appbar.dart';
// import 'package:test/component/my_appbar.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({super.key});
  void onLogout() {}
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChatScreen(),
    );
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

  Widget _buildMessageWidget(String message, String timestamp, int index) {
    final isFinalMessage = index == _messages.length - 1;
    final boxColor =
        isFinalMessage ? Color.fromRGBO(20, 174, 92, 1) : Colors.white;
    final textColor = isFinalMessage ? Colors.white : Colors.black;
    return Container(
      margin: EdgeInsets.only(left: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 메시지 송수신 시간
          Container(
              alignment: Alignment.centerLeft,
              margin:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              child: Text(
                timestamp,
                style: const TextStyle(color: Colors.black),
              )),
          // 메시지 박스 + 텍스트
          CustomPaint(
            painter: BubblePainter(color: boxColor),
            child: Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
              padding: const EdgeInsets.all(10.0),
              child: Text(
                message,
                style: TextStyle(color: textColor, fontSize: 40),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        myLeadingWidth: 130,
      ),
      body: Container(
        width: 393,
        height: 852,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Color(0xFFEDEDF4)),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _buildMessageWidget(
                      _messages[index], _timestamps[index], index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BubblePainter extends CustomPainter {
  final Color color;

  BubblePainter({
    required this.color,
  });

  final _radius = 10.0;
  final _x = 10.0;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(
          _x,
          0,
          size.width,
          size.height,
          bottomRight: Radius.circular(_radius),
          topRight: Radius.circular(_radius),
          topLeft: Radius.circular(_radius),
        ),
        Paint()
          ..color = color
          ..style = PaintingStyle.fill);
    var path = Path();
    path.moveTo(0, size.height);
    path.lineTo(_x, size.height);
    path.lineTo(_x, size.height - 20);
    canvas.clipPath(path);
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(
          0,
          0.0,
          _x,
          size.height,
          topRight: Radius.circular(_radius),
        ),
        Paint()
          ..color = color
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

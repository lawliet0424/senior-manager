import 'package:flutter/material.dart';
import 'package:knockknock/color.dart';
import 'package:knockknock/manager/manager/m_components/m_app_bar.dart';
import 'package:knockknock/manager/manager/nav1_message/m_myside_chatbox.dart';
import 'package:knockknock/manager/manager/nav1_message/m_otherside_chatbox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ManagerChatscreen extends StatefulWidget {
  const ManagerChatscreen({super.key});

  @override
  State<ManagerChatscreen> createState() => _ManagerChatscreenState();
}

class _ManagerChatscreenState extends State<ManagerChatscreen> {
  String managerid = "OI75iw9Z1oTlV2EyyL8C"; //임시로, 관리자 uid를 넣음
  String seniorid = "Y3wkpcrAscFryYYo4UOn"; //임시로, 돌봄 대상자 uid를 넣음
  String seniorname = "김철수"; // 임시로, 돌봄 대상자 이름을 넣음

  late ScrollController _scrollController;
  bool isWarning = false;

  List<Map<String, dynamic>> checkedData = [];
  List<Map<String, dynamic>> nowData = [];

  List<String> messages = [];
  List<String> timestamps = [];
  List<bool> isMe = [];
  List<bool> isReply = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    fetchChatMessages();
    checkIsWarning();
  }

  Future<void> fetchChatMessages() async {
    /*
    [message" 컬렉션 > 현재 관리자 문서 > "senior" 컬렉션 > '현재 돌봄 대상자 문서 > "checked" 컬렉션의 id] 가져오기
    */
    QuerySnapshot checkedSnapshot = await FirebaseFirestore.instance
        .collection('message')
        .doc(managerid)
        .collection('senior')
        .doc(seniorid)
        .collection('checked')
        .orderBy('date', descending: false)
        .get();

    /* 
    컬렉션 id를 통해, "checked" 컬렉션 내의 모든 문서를 checkedData 리스트에 추가하기
    */
    checkedData = checkedSnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    /*
    개별 문서 내에 저장된 메세지 정보 "msg_id", "writer_uid", "context", "date"를 가져와서 해당되는 리스트에 추가하기
    */
    checkedData.forEach((data) {
      //메세지 내용 저장
      messages.add(data['context']);
      //메세지 작성일시 저장
      timestamps.add(
          DateFormat('yyyy년 MM월 dd일 HH시 mm분').format(data['date'].toDate()));
      //메세지의 작성자가 '나(managerid)'인지 '상대쪽(seniorid)'인지 T/F로 구분하기
      if (data['writer_uid'] == managerid) {
        //작성자가 '나'인 경우
        isMe.add(true);
      } else {
        //작성자가 '상대쪽'인 경우
        isMe.add(false);
      }
      //"checked" 컬렉션 내의 메세지는 모두 답장을 받은 상태(무조건 T)
      isReply.add(true);
    });

    /*
    [message" 컬렉션 > 현재 관리자 문서 > "senior" 컬렉션 > 현재 돌봄 대상자 문서 > "now" 컬렉션의 id] 가져오기
    */
    QuerySnapshot nowSnapshot = await FirebaseFirestore.instance
        .collection('message')
        .doc(managerid)
        .collection('senior')
        .doc(seniorid)
        .collection('now')
        .orderBy('date', descending: false)
        .get();

    // 컬렉션 id를 통해, "now" 컬렉션 내의 모든 문서를 nowData 리스트에 추가
    nowData = nowSnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    // "now" 컬렉션 내의 가장 마지막 문서(가장 최근에 보낸 메세지)의 날짜를 가져오기
    // 차이 = 현재 시간 - 메세지가 생성된 시간
    Duration difference = DateTime.now()
        .difference(((nowSnapshot.docs.last['date']) as Timestamp).toDate());
    bool nowState = true;
    if (difference.inHours > 6) {
      //메세지를 보낸지 6시간이 경과된 경우(답장을 받지 못했다고 함)
      nowState = false;
    } else {
      //메세지를 보낸지 6시간이 지나지 않은 경우(답장을 받았다고 가정함)
      nowState = true;
    }

    /*
    개별 문서 내에 저장된 메세지 정보 "msg_id", "writer_uid", "context", "date"를 가져와서 해당되는 리스트에 추가하기
    */
    nowData.forEach((data) {
      //메세지 내용 저장
      messages.add(data['context']);
      //메세지 작성일시 저장
      timestamps.add(
          DateFormat('yyyy년 MM월 dd일 HH시 mm분').format(data['date'].toDate()));
      //메세지의 작성자는 '나(managerid)'인 경우만 존재, 무조건 T
      isMe.add(true);
      //"now" 컬렉션의 가장 마지막 문서(가장 최근 메세지)의 생성일자와 현재 시간과의 차이에 따라 켈렉션 내의 모든 문서의 색이 변함
      isReply.add(nowState);
    });

    //답장을 받지 못한 경우, 색깔을 바꿔주는 함수 실행
    setState(() {
      this.messages = messages;
      this.timestamps = timestamps;
      this.isMe = isMe;
      this.isReply = isReply;
      checkIsWarning();
    });
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
          itemCount: messages.length,
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
                  name: seniorname,
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

}

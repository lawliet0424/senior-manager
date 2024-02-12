import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:knockknock/color.dart';
import 'package:knockknock/manager/manager/m_components/m_app_bar.dart';
import 'package:knockknock/manager/manager/nav1_message/m_chatscreen.dart';
import 'package:knockknock/manager/manager/nav1_message/m_message_preview.dart';

class ManagerMessageInitial extends StatefulWidget {
  final String managerid = "OI75iw9Z1oTlV2EyyL8C";

  const ManagerMessageInitial({Key? key}) : super(key: key);

  @override
  State<ManagerMessageInitial> createState() => _ManagerMessageInitialState();
}

class _ManagerMessageInitialState extends State<ManagerMessageInitial> {
  String seniorname = "";
  String seniorid = "";

  List<Map<String, dynamic>> seniorDocs = [];

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // senior 컬렉션의 전체 문서 가져오기
  Future<QuerySnapshot> _getSeniorCollection() async {
    return FirebaseFirestore.instance
        .collection('message')
        .doc(widget.managerid)
        .collection('senior')
        .get();
  }

  // 가장 최근 메세지 가져오기
  Future<QuerySnapshot> _getLatestMessage(
      String seniorid, String subCollection) async {
    return FirebaseFirestore.instance
        .collection('message')
        .doc(widget.managerid)
        .collection('senior')
        .doc(seniorid)
        .collection(subCollection)
        .orderBy('date', descending: true)
        .get();
  }

  // 메세지 프리뷰 아이템 빌드
  Widget _buildMessagePreviewItem(
      BuildContext context, Map<String, dynamic> seniorData) {
    seniorname = seniorData['name']?.toString() ?? 'Unknown';
    seniorid = seniorData['uid'];

    return FutureBuilder<QuerySnapshot>(
      future: seniorData['now'] != null
          ? _getLatestMessage(seniorData['uid'], 'now')
          : _getLatestMessage(seniorData['uid'], 'checked'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          var latestSnapshot = snapshot.data!;
          var msg = (latestSnapshot.docs.first['context'] != null)
              ? latestSnapshot.docs.first['context']
              : "메세지 내역이 없습니다.";

          return ManagerMessagePreview(
            photo: 'assets/images/user_profile.jpg',
            name: seniorname,
            latest: msg,
            bgColor: MyColor.myBackground,
            previewTapped: () => onMessagePreviewClicked(seniorData),
          );
        }
      },
    );
  }

  // 각 아이템을 눌렀을 때 호출되는 함수
  void onMessagePreviewClicked(Map<String, dynamic> seniorData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ManagerChatscreen(
          managerid: "OI75iw9Z1oTlV2EyyL8C",
          seniorid: seniorData['uid'], // seniorData에서 uid 가져오기
          seniorname: seniorData['name'], // seniorname 전달
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.myBackground,
      appBar: const ManagerAppBar(
        title: '메세지',
        size: 95,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: _getSeniorCollection(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else {
            seniorDocs = snapshot.data!.docs
                .map((doc) => doc.data() as Map<String, dynamic>)
                .toList();
            return Scrollbar(
              controller: _scrollController,
              trackVisibility: true,
              thumbVisibility: true,
              thickness: 5,
              radius: const Radius.circular(20),
              child: ListView.builder(
                controller: _scrollController,
                itemCount: seniorDocs.length,
                itemBuilder: (context, index) {
                  return _buildMessagePreviewItem(context, seniorDocs[index]);
                },
              ),
            );
          }
        },
      ),
    );
  }
}


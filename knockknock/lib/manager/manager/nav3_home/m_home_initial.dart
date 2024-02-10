import 'package:flutter/material.dart';
import 'package:knockknock/color.dart';
import 'package:knockknock/manager/manager/m_components/m_app_bar.dart';
import 'package:knockknock/manager/components/mybutton.dart';
import 'package:knockknock/manager/components/mypopup.dart';
import 'package:knockknock/manager/manager/m_components/m_senior_profile_box.dart';
import 'package:knockknock/manager/manager/nav3_home/m_selected_knocking.dart';
import 'package:knockknock/manager/manager/nav3_home/m_senior_profile.dart';

class ManagerHomeInitial extends StatefulWidget {
  const ManagerHomeInitial({super.key});

  @override
  State<ManagerHomeInitial> createState() => _ManagerHomeInitialState();
}

class _ManagerHomeInitialState extends State<ManagerHomeInitial> {
  final int numberofSeniors = 10;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void onSeniorProfileBoxClicked(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SeniorProfile(index: index),
      ),
    );
  }

  void onselectedNocking() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SelectedKnocking(),
      ),
    );
  }

  // 💛 전체 문 두드리기
  void onAllNocking() {
    showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          actionsPadding: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(60)),
          ),
          actions: [
            MyPopUp(
              date: getCurrentDateTime(),
              msg: "전체 문 두드리기 완료!",
            ),
          ],
        );
      }),
    );
  }

  String getCurrentDateTime() {
    DateTime now = DateTime.now();

    int year = now.year;
    int month = now.month;
    int day = now.day;
    int hour = now.hour;
    int minute = now.minute;

    return '$year년 $month월 $day일 $hour시 $minute분';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: MyColor.myBackground,
      appBar: const ManagerAppBar(
        size: 95,
        title: '홈',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 630,
              child: Scrollbar(
                controller: _scrollController,
                trackVisibility: true,
                thumbVisibility: true,
                thickness: 5,
                radius: const Radius.circular(20),
                child: GridView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 37),
                  shrinkWrap: true,
                  itemCount: numberofSeniors,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 220,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (BuildContext context, index) {
                    return SeniorProfileBox(
                      photo: 'assets/images/user_profile.jpg',
                      name: '이름',
                      bgColor: MyColor.myWhite,
                      buttonTapped: () => onSeniorProfileBoxClicked(index),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton(
                    text: '선택 문 두드리기',
                    buttonColor: MyColor.myMediumGrey,
                    txtColor: MyColor.myBlack,
                    buttonTapped: onselectedNocking,
                  ),
                  const SizedBox(height: 10),
                  MyButton(
                    text: '전체 문 두드리기',
                    buttonColor: MyColor.myBlue,
                    txtColor: MyColor.myWhite,
                    buttonTapped: onAllNocking,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

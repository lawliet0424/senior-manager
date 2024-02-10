import 'package:flutter/material.dart';
import 'package:knockknock/senior/component/my_appbar.dart';
import 'package:knockknock/senior/component/profile_imang_name.dart';
import 'package:knockknock/senior/component/profile_info.dart';

class SeniorProfile extends StatelessWidget {
  const SeniorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xffEDEDF4),
      appBar: MyAppBar(
        myLeadingWidth: 130,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: ProfileImageName(
                    photo: "assets/basic_profile.png",
                    name: '이름',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  child: ProfileInfo(
                    firstTitle: '전화번호',
                    firstContent: '010-XXXX-XXXX',
                    seceondTitle: '주소',
                    secondContent: '서울특별시 마포구 와우산로 94',
                    thirdTitle: '보호자',
                    thirdContent: '010-OOOO-OOOO',
                    gap: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

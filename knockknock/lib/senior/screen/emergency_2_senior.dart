import 'package:flutter/material.dart';
import 'package:knockknock/senior/component/my_appbar.dart';

class EmergencyCompletePage extends StatelessWidget {
  const EmergencyCompletePage({super.key});
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
        decoration: const BoxDecoration(color: Color(0xFFEDEDF4)),
        child: Stack(
          children: [
            // 배경
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 393,
                height: 852,
                decoration: const BoxDecoration(color: Color(0xFFEDEDF4)),
              ),
            ),
            //사회복지사 프로필+이름
            Positioned(
              left: 0,
              right: 0,
              top: 50,
              child: SizedBox(
                width: 354,
                height: 200,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/basic_profile.png'),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 170,
                      child: SizedBox(
                        child: Text(
                          '김아무개 사회복지사',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF1E1E1E),
                            fontSize: 30,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0.06,
                            letterSpacing: -0.53,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //위치+연락처 정보
            Positioned(
              left: 50,
              right: 50,
              top: 370,
              child: Container(
                width: 30,
                height: 250,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: Center(
                  child: Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 230,
                      height: 130,
                      decoration: BoxDecoration(
                        color: Colors.transparent, // 투명 배경
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: Color(0xFFCCCCCC), width: 4), // 회색 테두리
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/map.png'),
                            width: 100,
                            height: 80,
                          ),
                          Text(
                            '서울특별시 마포구 와우산로 94',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '보호자 연락처',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      width: 230,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.transparent, // 투명 배경
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: Color(0xFFCCCCCC), width: 4), // 회색 테두리
                      ),
                      child: Text(
                        '010-1234-5678',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
              ),
            ),
            // 긴급 전송 버튼
            Positioned(
              left: 50,
              right: 50,
              top: 250,
              child: OutlinedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, '/emergency_call');
                },
                child: const Text(
                  '연락처 & 위치 정보 전송 완료',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(333, 70),
                  backgroundColor: Color(0xFFF24822),
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

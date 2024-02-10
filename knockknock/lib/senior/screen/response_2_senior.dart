import 'package:flutter/material.dart';
import 'package:knockknock/senior/component/my_appbar.dart';
import 'package:knockknock/senior/screen/record_senior.dart';

class ResponseCompletePage extends StatelessWidget {
  const ResponseCompletePage({super.key});

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
        decoration: BoxDecoration(color: Color(0xffEDEDF4)),
        //배경
        child: Stack(
          children: [
            // 배경 색
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 393,
                height: 852,
                decoration: BoxDecoration(color: Color(0xffEDEDF4)),
              ),
            ),
            //사회복지사 프로필+이름
            Positioned(
              left: 0,
              right: 0,
              top: 50,
              child: Container(
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
            //'잘 계시나요?' 박스
            Positioned(
              left: 50,
              right: 50,
              top: 270,
              child: Container(
                width: 30,
                height: 200,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(
                        color: const Color.fromARGB(255, 206, 206, 206),
                        width: 3),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '대답하셨습니다!',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      Transform.scale(
                        scale: 2,
                        child: Checkbox(
                          activeColor:
                              const Color.fromARGB(255, 0, 0, 0).withOpacity(1),
                          value: true,
                          onChanged: null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // 마지막 대답 날짜
            Positioned(
              left: 35,
              top: 600,
              child: SizedBox(
                width: 325,
                height: 200,
                child: Text(
                  '마지막 대답 날짜: \n지금',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 1,
                    letterSpacing: -0.53,
                  ),
                ),
              ),
            ),
            // 기록 화면 가기 버튼
            Positioned(
              left: 40,
              right: 40,
              top: 500,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RecordPage()));
                },
                child: const Text(
                  '기록 화면 가기',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(333, 83),
                  backgroundColor: Color(0xFF3475EB),
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

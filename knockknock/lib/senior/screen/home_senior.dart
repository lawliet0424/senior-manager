import 'package:flutter/material.dart';
import 'package:knockknock/senior/component/my_appbar.dart';
import 'package:knockknock/senior/screen/emergency_senior.dart';
import 'package:knockknock/senior/screen/response_senior.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void onLogout() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          leadingText: '로그아웃',
          leadingCallback: onLogout,
          myLeadingWidth: 130,
        ),
        body: Container(
          width: 393,
          height: 800,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xffEDEDF4)),
          child: Stack(
            children: [
              // 프로필
              Positioned(
                left: 18,
                bottom: MediaQuery.of(context).size.height / 2 + 60,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: Color(0xF5F5F5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    side: const BorderSide(
                      color: Colors.white, // 테두리 색상
                    ),
                  ),
                  child: SizedBox(
                    width: 354,
                    height: 148,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 25,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/basic_profile.png')),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 141,
                          top: 35,
                          child: SizedBox(
                            width: 103,
                            child: Text(
                              '홍길동',
                              style: TextStyle(
                                color: Color(0xFF1E1E1E),
                                fontSize: 24,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0.06,
                                letterSpacing: -0.53,
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 141,
                          top: 69,
                          child: SizedBox(
                            width: 176,
                            child: Text(
                              '서울특별시 마포구 와우산로 94',
                              style: TextStyle(
                                color: Color(0xFF1E1E1E),
                                fontSize: 13,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0.12,
                                letterSpacing: -0.25,
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 141,
                          top: 105,
                          child: SizedBox(
                            width: 205,
                            child: Text(
                              '담당 사회복지사 : 김아무개 (마포구노인복지센터)',
                              style: TextStyle(
                                color: Color(0xFF1E1E1E),
                                fontSize: 9,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0.17,
                                letterSpacing: -0.10,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 141,
                          top: 90,
                          child: Container(
                            width: 181,
                            height: 7,
                            decoration: ShapeDecoration(
                              color: const Color(0xCC3475EB),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // 알림 버튼, 긴급 호출 버튼
              Positioned(
                left: 42,
                top: 250,
                child: SizedBox(
                  width: 309,
                  height: 360,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ResponsePage()));
                          },
                          icon: const Icon(Icons.person_pin_outlined, size: 60),
                          label: const Text(
                            '알림',
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
                            fixedSize: const Size(309, 168),
                            backgroundColor: const Color(0xFF3475EB),
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(39))),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 192,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EmergencyPage()));
                          },
                          icon: const Icon(null, size: 60),
                          label: const Text(
                            '긴급\n호출',
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
                            fixedSize: const Size(309, 168),
                            backgroundColor: const Color(0xFFF24822),
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(39))),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 65,
                        top: 50.92,
                        child: SizedBox(
                          width: 153,
                          height: 271.08,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 187.08,
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/Siren_white.png"),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

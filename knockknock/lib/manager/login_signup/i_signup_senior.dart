import 'package:flutter/material.dart';
import 'package:knockknock/color.dart';
import 'package:knockknock/manager/login_signup/i_input_form.dart';
import 'package:knockknock/manager/login_signup/i_login.dart';
import 'package:knockknock/manager/login_signup/i_signup_choose.dart';
import 'package:knockknock/manager/components/mybutton.dart';
import 'package:knockknock/manager/components/mytitle.dart';
import 'package:knockknock/manager/components/mypopup.dart';

class SeniorSignUp extends StatelessWidget {
  SeniorSignUp({super.key});

  void onSettingProfile() {
    // 프로필 이미지를 설정하는 기능
  }

  void onSeniorSignUpDone(BuildContext context) {
    if (_nameController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _pwController.text.isEmpty) {
      showDialog(
        context: context,
        builder: ((context) {
          return const AlertDialog(
            actionsPadding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(60)),
            ),
            actions: [
              MyPopUp(
                date: "입력 오류",
                msg: "모든 입력란을 채워주세요",
              ),
            ],
          );
        }),
      );
    } else {
      // 일단 모든 칸이 비어 있지는 않은 상태
      // _nameController.text
      // _phoneController.text
      // _pwController.text
      // (필요하다면) 제대로 입력되었는지 확인하는 기능을 추가해야 할 수도?
      // 실제로 서버와 연결하여 회원가입 기능 구현 필요
      showDialog(
        // 회원가입이 정상적으로 완료되었을 때 띄울 팝업
        context: context,
        builder: ((context) {
          return AlertDialog(
            actionsPadding: const EdgeInsets.all(0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(60)),
            ),
            actions: [
              MyPopUp(
                date: "회원가입 완료",
                msg: "확인을 눌러 로그인하러 가기",
                donebuttonTapped: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
              ),
            ],
          );
        }),
      );
    }
  }

  void onSeniorSignUpCancel(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpChoose(),
      ),
    );
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: MyColor.myBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(size: 30),
        scrolledUnderElevation: 0,
        backgroundColor: MyColor.myBackground,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 150,
                    child: MyTitle(
                      title: '2단계. 회원가입',
                      explain: '모든 항목을 입력하세요',
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: onSettingProfile,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/basic_profile.png",
                        width: 130,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  InputForm(title: "이름", controller: _nameController),
                  const SizedBox(height: 40),
                  InputForm(title: "전화번호", controller: _phoneController),
                  const SizedBox(height: 40),
                  InputForm(title: "비밀번호", controller: _pwController),
                  const SizedBox(height: 65),
                  MyButton(
                    width: 400,
                    text: '취소',
                    buttonColor: MyColor.myMediumGrey,
                    txtColor: MyColor.myBlack,
                    buttonTapped: () => onSeniorSignUpCancel(context),
                  ),
                  const SizedBox(height: 10),
                  MyButton(
                    width: 400,
                    text: '완료',
                    buttonColor: MyColor.myBlue,
                    txtColor: MyColor.myWhite,
                    buttonTapped: () => onSeniorSignUpDone(context),
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

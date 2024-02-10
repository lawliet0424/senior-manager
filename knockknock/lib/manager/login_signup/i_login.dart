import 'package:flutter/material.dart';
import 'package:knockknock/color.dart';
import 'package:knockknock/manager/login_signup/i_input_form.dart';
import 'package:knockknock/manager/login_signup/i_signup_choose.dart';
import 'package:knockknock/manager/components/mybutton.dart';
import 'package:knockknock/manager/components/mypopup.dart';
import 'package:knockknock/manager/manager/nav3_home/m_home_initial.dart';
import 'package:knockknock/main.dart';
import 'package:knockknock/manager/manager/manager_initial.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  void onLoginClicked(BuildContext context) async {
    if (_phoneController.text.isEmpty || _pwController.text.isEmpty) {
      // 한 칸이라도 입력이 안되면 오휴 팝업
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
      // 전화번호와 비밀번호 칸 모두 입력이 있을 때
      // 회원가입 되어 있는 정보와 일치하는지 확인하고 로그인 성공 or 실패 팝업
      // _phoneController.text : 전화번호에 입력한 내용
      // _pwController.text) : 비밀번호에 입력한 내용
      String phoneNumber = _phoneController.text;
      // 전화번호 입력 값
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('users')
          .where('phonenumber', isEqualTo: phoneNumber)
          .get();
      // firestore에서 입력받은 전화번호와 일치하는 document찾기
      if (snapshot.docs.isNotEmpty) {
        // 해당 전화번호를 사용하는 사용자가 있는 경우
        DocumentSnapshot<Map<String, dynamic>> userSnapshot =
            snapshot.docs.first;
        String? role = userSnapshot['role'];
        // 해당 사용자의 role을 가져오기
        if (role == 'manager') {
          //관리자인 경우
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ManagerInitial()),
          );
        } else if (role == 'senior') {
          //돌봄 대상자인 경우
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SeniorMain()),
          );
        }
      }
    }
  }

  void onToSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpChoose(),
      ),
    );
  }

  void onGoogleLogin() {
    // 구글 로그인 구현
  }

  void onForgetPassword() {
    // (선택) 비밀번호 찾기 구현
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: MyColor.myBlue,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(250),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBar(
                backgroundColor: MyColor.myBlue,
                title: const Center(
                  child: Text(
                    "KNOCKKNOCK!",
                    style: TextStyle(
                      color: MyColor.myWhite,
                      fontSize: 45,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: MyColor.myBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 400,
                    child: Text(
                      "로그인",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 30),
                  InputForm(title: "전화번호", controller: _phoneController),
                  const SizedBox(height: 30),
                  InputForm(title: "비밀번호", controller: _pwController),
                  const SizedBox(height: 45),
                  MyButton(
                    width: 400,
                    buttonColor: MyColor.myBlue,
                    text: "확인",
                    txtColor: Colors.white,
                    buttonTapped: () => onLoginClicked(context),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: onForgetPassword,
                          child: const Text(
                            "비밀번호 찾기",
                            style: TextStyle(
                              color: MyColor.myDarkGrey,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => onToSignUp(context),
                          child: const Text(
                            "회원가입",
                            style: TextStyle(
                              color: MyColor.myBlue,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const SizedBox(
                    width: 400,
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(color: MyColor.myDarkGrey),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "또는",
                            style: TextStyle(
                              color: MyColor.myDarkGrey,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: MyColor.myDarkGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: onGoogleLogin,
                    child: Column(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/images/google.png',
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "구글 계정으로 간편 로그인",
                          style: TextStyle(
                            color: MyColor.myDarkGrey,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

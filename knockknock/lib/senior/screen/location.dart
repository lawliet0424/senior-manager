import 'package:flutter/material.dart';
import 'package:knockknock/senior/component/my_appbar.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          myLeadingWidth: 130,
        ),
        body: Container(
            width: 393,
            height: 852,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Color(0xFFEDEDF4)),
            child: Stack(children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 230,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.transparent, // 투명 배경
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color(0x3475EB), width: 4), // 파란색 테두리
                  ),
                  // child:
                ),
              ),
            ])));
  }
}

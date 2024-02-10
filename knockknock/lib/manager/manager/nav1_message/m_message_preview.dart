import 'package:flutter/material.dart';
import 'package:knockknock/color.dart';

class ManagerMessagePreview extends StatelessWidget {
  final String photo;
  final String name;
  final String latest;
  final Color bgColor;
  final VoidCallback previewTapped;

  const ManagerMessagePreview(
      {super.key,
      required this.photo,
      required this.name,
      required this.latest,
      required this.bgColor,
      required this.previewTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: previewTapped,
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          color: bgColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  photo,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 25),
                  ),
                  Text(latest,
                      style: const TextStyle(
                        fontSize: 20,
                        color: MyColor.myDarkGrey,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

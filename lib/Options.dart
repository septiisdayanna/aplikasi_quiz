import 'package:apk_quiz/HomePage.dart';
import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final String option;
  final Function(String) onTapCallback;

  Options({Key? key, required this.option, required this.onTapCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            onTapCallback(option);
          },
          child: Container(
            height: 48,
            width: 240,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 3, color: Color(0xffA42FC1))
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(option, style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

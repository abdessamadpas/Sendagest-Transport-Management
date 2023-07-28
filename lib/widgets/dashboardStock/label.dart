import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  String text;
  bool main;
  Label({super.key, required this.text, required this.main});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: main ? 200 : 100,
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xff8EA3B7),
            fontSize: main ? 22 : 17,
            fontWeight: main ? FontWeight.w700 : FontWeight.w500,
          ),
        ));
  }
}

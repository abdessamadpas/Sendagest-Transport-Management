import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class TabBar_icon extends StatelessWidget {
  final Icon icon;
  const TabBar_icon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF4D70A6).withOpacity(.2),
        boxShadow: const [
          BoxShadow(
            offset: Offset(-20, -20),
            blurRadius: 60,
            color: Colors.white,
            inset: true,
          ),
          BoxShadow(
            offset: Offset(20, 20),
            color: Color(0xFFF1F3F6),
            spreadRadius: -12.0,
            blurRadius: 12.0,
          ),
        ],
      ),
      child: Icon(
        Icons.home,
        color: Color(0xFF4D70A6),
      ),
    );
  }
}

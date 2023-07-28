import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../constant.dart';

class CardActivity extends StatefulWidget {
  String title;
  IconData icon;
  String value;
  String percent;
  CardActivity(
      {super.key,
      required this.title,
      required this.icon,
      required this.value,
      required this.percent});

  @override
  State<CardActivity> createState() => _CardActivityState();
}

class _CardActivityState extends State<CardActivity> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kLightBlue,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Icon(widget.icon, color: Color(0xff8EA3B7), size: 15),
                const Gap(5),
                Text(widget.title,
                    style: const TextStyle(
                        color: Color(0xff8EA3B7), fontSize: 15)),
              ],
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.value,
                    style: const TextStyle(
                      color: Color(0xff006ED3),
                      fontSize: 30,
                    )),
                Text(widget.percent,
                    style: const TextStyle(
                        color: Color(0xff8EA3B7), fontSize: 15)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

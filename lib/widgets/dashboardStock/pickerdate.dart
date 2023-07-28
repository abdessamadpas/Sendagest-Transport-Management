import 'package:flutter/material.dart';
import 'package:sendatrack/constant.dart';

class Pickerdate extends StatelessWidget {
  const Pickerdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 245, 245, 245),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "10/10/2021",
              style: TextStyle(
                color: kGrayIcon,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              Icons.calendar_today_outlined,
              color: Color.fromARGB(255, 165, 165, 165),
              size: 19,
            )
          ]),
    ));
  }
}

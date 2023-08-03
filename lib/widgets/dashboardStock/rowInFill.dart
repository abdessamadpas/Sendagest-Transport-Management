import 'package:flutter/material.dart';
import '../../../constant.dart';

class RowInFill extends StatelessWidget {
  const RowInFill({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('RowInFill',
              style: TextStyle(
                  color: Color.fromARGB(255, 122, 122, 122),
                  fontWeight: FontWeight.w400,
                  fontSize: 14)),
          Text(' RowInFill',
              style: TextStyle(
                  color: kGreen, fontWeight: FontWeight.w500, fontSize: 15))
        ],
      ),
    );
  }
}

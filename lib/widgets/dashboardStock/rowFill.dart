import 'package:flutter/material.dart';
import '../../../constant.dart';

class RowFill extends StatefulWidget {
  String label;
  String value;
  bool fill;
  RowFill(
      {super.key,
      required this.label,
      required this.value,
      required this.fill});

  @override
  State<RowFill> createState() => _RowFillState();
}

class _RowFillState extends State<RowFill> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: widget.fill
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: kGrey,
            )
          : const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.label,
              style: const TextStyle(
                  color: Color.fromARGB(255, 122, 122, 122),
                  fontWeight: FontWeight.w400,
                  fontSize: 14)),
          Text(widget.value,
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w500,
                  fontSize: 15))
        ],
      ),
    );
  }
}

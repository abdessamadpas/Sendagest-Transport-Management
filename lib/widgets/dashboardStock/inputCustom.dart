import 'package:flutter/material.dart';
import 'package:sendatrack/constant.dart';

class InputCustom extends StatefulWidget {
  TextEditingController controller;

  final String hint;
  bool numeric;

  InputCustom(
      {super.key,
      required this.hint,
      required this.numeric,
      required this.controller});

  @override
  State<InputCustom> createState() => _InputCustomState();
}

class _InputCustomState extends State<InputCustom> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        // padding: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 245, 245, 245),
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextField(
          controller: widget.controller,
          keyboardType:
              widget.numeric ? TextInputType.number : TextInputType.text,
          // expands: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hint,
            hintStyle: const TextStyle(
              color: kGrayIcon,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            fillColor: Color.fromARGB(255, 241, 8, 8),
            contentPadding: EdgeInsets.all(10),
          ),
        ),
      ),
    );
  }
}

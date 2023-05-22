// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../constant.dart';

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            child: Text(
              'Add Traject',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: kDarkBlue, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                color: Color.fromARGB(77, 146, 217, 255),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                cursorColor: Color.fromARGB(197, 83, 182, 221),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 5, bottom: 11, top: 11, right: 15),
                    hintText: "typing here"),
              )),
        ],
      ),
    );
  }
}

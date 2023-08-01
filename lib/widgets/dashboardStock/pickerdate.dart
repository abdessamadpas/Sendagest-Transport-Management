import 'package:flutter/material.dart';
import 'package:sendatrack/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

class Pickerdate extends StatefulWidget {
  const Pickerdate({super.key});

  @override
  State<Pickerdate> createState() => _PickerdateState();
}

class _PickerdateState extends State<Pickerdate> {
  DateTime? selectedDate;

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
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 245, 245, 245),
              borderRadius: BorderRadius.circular(60),
            ),
            height: 60,
            child: TimePickerSpinnerPopUp(
              mode: CupertinoDatePickerMode.date,
              initTime: DateTime.now(),
              minTime: DateTime.now().subtract(const Duration(days: 10)),
              maxTime: DateTime.now().add(const Duration(days: 10)),
              barrierColor: Color.fromARGB(31, 113, 183, 218),
              timeFormat: 'dd/MM/yyyy',
              // Customize your time widget
              // timeWidgetBuilder: (dateTime) {
              //   return Text(
              //     dateTime.day.toString() +
              //         '/' +
              //         dateTime.month.toString() +
              //         '/' +
              //         dateTime.year.toString(),
              //     style: const TextStyle(
              //       color: kGrayIcon,
              //       fontSize: 15,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   );
              // },
              onChange: (dateTime) {
                setState(() {
                  selectedDate = dateTime;
                });
              },
            ),
          )),
    );
  }
}

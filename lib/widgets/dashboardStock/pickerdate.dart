import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';
import 'package:get/get.dart';
import 'package:sendatrack/controllers/stock/movementController.dart';

class Pickerdate extends StatefulWidget {
  const Pickerdate({super.key});

  @override
  State<Pickerdate> createState() => _PickerdateState();
}

class _PickerdateState extends State<Pickerdate> {
  DateTime? selectedDate = DateTime.now();
  MovementController controller = Get.put(MovementController());

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
      child: TimePickerSpinnerPopUp(
        mode: CupertinoDatePickerMode.date,
        initTime: DateTime.now(),
        // minTime: DateTime.now().subtract(const Duration(days: 10)),
        // maxTime: DateTime.now().add(const Duration(days: 10)),
        barrierColor: Colors.black12, //Barrier Color when pop up show
        minuteInterval: 1,
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
        cancelText: 'Cancel',
        confirmText: 'OK',
        pressType: PressType.singlePress,
        timeFormat: 'dd/MM/yyyy',
        // Customize your time widget
        timeWidgetBuilder: (dateTime) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${selectedDate?.day.toString().padLeft(2, '0')}/${selectedDate?.month.toString().padLeft(2, '0')}/${selectedDate?.year.toString().padLeft(2, '0')}', //DateFormat('dd/MM/yyyy').format(dateTime),
                style: TextStyle(
                  color: Color.fromARGB(255, 45, 64, 71),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.calendar_today_outlined,
                color: Color.fromARGB(255, 45, 64, 71),
                size: 20,
              )
            ],
          );
        },
        onChange: (dateTime) {
          setState(
            () {
              selectedDate = dateTime;
            },
          );
          controller.selectedDate = selectedDate;
        },
      ),
    ));
  }
}

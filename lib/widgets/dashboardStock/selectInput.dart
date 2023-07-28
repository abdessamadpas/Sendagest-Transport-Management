import 'package:flutter/material.dart';
import 'package:sendatrack/constant.dart';

class SelectInput extends StatefulWidget {
  const SelectInput({super.key});

  @override
  State<SelectInput> createState() => _SelectInputState();
}

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class _SelectInputState extends State<SelectInput> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 245, 245, 245),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButton<String>(
            value: dropdownValue,
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 27),
            elevation: 16,
            dropdownColor: const Color.fromARGB(255, 245, 245, 245),
            style: const TextStyle(
              color: kGrayIcon,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )),
    );
  }
}

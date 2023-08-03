import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sendatrack/constant.dart';
import 'package:sendatrack/controllers/stock/movementController.dart';

class SelectInput extends StatefulWidget {
  List<String?> list;
  String type;
  SelectInput({super.key, required this.list, required this.type});

  @override
  State<SelectInput> createState() => _SelectInputState();
}

class _SelectInputState extends State<SelectInput> {
  MovementController controller = Get.put(MovementController());

  String? dropdownValue;

  @override
  void initState() {
    super.initState();

    if (widget.list.isNotEmpty) {
      controller.changeStateSelectedValue(widget.type, "Select a value");
    } else {
      print(widget.list.length);
      dropdownValue = "Select a value";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
          child: widget.list
                  .isNotEmpty // Check if the list is not empty before building DropdownButton
              ? Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 245, 245, 245),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton<String>(
                    value: controller.getSelectedVariable(widget.type) ??
                        dropdownValue,
                    isExpanded: true,
                    icon:
                        const Icon(Icons.keyboard_arrow_down_rounded, size: 27),
                    elevation: 16,
                    dropdownColor: const Color.fromARGB(255, 245, 245, 245),
                    style: const TextStyle(
                      color: kGrayIcon,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    onChanged: (String? value) {
                      controller.changeStateSelectedValue(widget.type, value);
                    },
                    items: [
                      DropdownMenuItem<String>(
                        value: "Select a value",
                        child: Text("Select a value"),
                      ),
                      ...widget.list
                          .map<DropdownMenuItem<String>>((String? value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value ?? ""),
                        );
                      }).toList(),
                    ],
                  ),
                )
              : CircularProgressIndicator(), // Show a loading indicator when the list is empty
        ));
  }
}

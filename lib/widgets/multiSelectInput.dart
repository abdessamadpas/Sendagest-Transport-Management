import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:sendatrack/constant.dart';
import 'package:sendatrack/widgets/dashboardStock/subcardMovementList.dart';
import 'package:sendatrack/controllers/stock/logMovementController.dart';
import 'package:get/get.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final bool isCitySelected;
  final List<SelectedListItem>? cities;
  final String type;
  // final dynamic controllerUsed;

  const AppTextField({
    required this.textEditingController,
    this.title = "",
    required this.hint,
    required this.isCitySelected,
    this.cities,
    required this.type,
    // this.controllerUsed,
    Key? key,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  LogMovementController controller = Get.put(LogMovementController());

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    DropDownState(
      DropDown(
        isDismissible: true,
        bottomSheetTitle: Text(
          widget.type,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.cities ?? [],
        selectedItems: (List<dynamic> selectedList) {
          controller.selectedList.clear();
          List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              list.add(item.name);

              for (var item in list) {
                controller.selectedList.add(item);
              }
            }
          }
          controller.fetchStock();

          // widget.controllerUsed.selectedList = list.toString();
          // showSnackBar(list.toString());
          setState(() {
            String arrayAsString = list.join('🖇️ ');
            widget.textEditingController.text = arrayAsString.toString();
          });
        },

        //! to  enable multiple
        enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //! add title label to text field
        // Text(widget.title),
        // const SizedBox(
        //   height: 5.0,
        // ),
        TextFormField(
          controller: widget.textEditingController,
          cursorColor: Colors.black,
          onTap: widget.isCitySelected
              ? () {
                  FocusScope.of(context).unfocus();
                  onTextFieldTap();
                }
              : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 255, 255, 255),
            contentPadding:
                const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
            hintText: widget.hint,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Color.fromARGB(255, 201, 23, 23),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            suffixIcon: const Icon(
              Icons.arrow_downward_outlined,
              color: lightBlue,
            ), // You can use any icon you like here
          ),
        ),
      ],
    );
  }
}

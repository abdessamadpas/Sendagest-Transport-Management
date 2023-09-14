import 'package:flutter/material.dart';
import 'package:sendatrack/constant.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sendatrack/controllers/stock/logMovementController.dart';
import 'package:sendatrack/widgets/custom_date_range_picker.dart';
import 'package:sendatrack/widgets/multiSelectInput.dart';

class HeaderMovementList extends StatefulWidget {
  const HeaderMovementList({super.key});
  @override
  State<HeaderMovementList> createState() => _HeaderMovementListState();
}

class _HeaderMovementListState extends State<HeaderMovementList> {
  LogMovementController controller = Get.put(LogMovementController());
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 45,
                  // width: 200,
                  margin: EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    onChanged: (value) => controller.filterSearchResults(value),
                    autofocus: false,
                    cursorColor: Color.fromARGB(255, 73, 73, 73),
                    style: const TextStyle(color: Colors.grey),
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 156, 156, 156)),
                      prefixIcon:
                          Icon(Icons.search, color: lightBlue, size: 20),
                      fillColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                        // borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        // borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 0),
                      ),
                    ),
                  ),
                )),
              ],
            ),
            const Gap(10),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: AppTextField(
                      textEditingController:
                          controller.storeTextEditingController,
                      title: 'Stores',
                      type: 'Store',
                      hint: 'choose store',
                      isCitySelected: true,
                      cities: controller.listOfStores,
                    ),
                  ),
                  const Gap(20),
                  Row(
                    children: [
                      controller.startDate != null && controller.endDate != null
                          ? Column(
                              children: [
                                Text(
                                    controller.startDate != null
                                        ? controller.startDate
                                            .toString()
                                            .substring(0, 10)
                                        : 'select a Date',
                                    style: const TextStyle(
                                        color: lightBlue,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15)),
                                Text(
                                    controller.endDate != null
                                        ? controller.endDate
                                            .toString()
                                            .substring(0, 10)
                                        : 'end',
                                    style: const TextStyle(
                                        color: lightBlue,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15))
                              ],
                            )
                          : Container(),
                      IconButton(
                        icon: const Icon(Icons.calendar_month_outlined),
                        color: lightBlue,
                        onPressed: () {
                          showCustomDateRangePicker(
                            context,
                            dismissible: true,
                            minimumDate: DateTime.now()
                                .subtract(const Duration(days: 50000)),
                            maximumDate:
                                DateTime.now().add(const Duration(days: 50000)),
                            endDate: controller.endDate,
                            startDate: controller.startDate,
                            backgroundColor: Colors.white,
                            primaryColor: kDarkBlue,
                            onApplyClick: (start, end) {
                              controller.endDate = end;
                              controller.startDate = start;
                              controller.isSavedTime.value =
                                  !controller.isSavedTime.value;
                              debugPrint(
                                  'debug: $controller.startDate  + $controller.endDate');
                            },
                            onCancelClick: () {
                              controller.endDate = null;
                              controller.startDate = null;
                              controller.isSavedTime.value =
                                  !controller.isSavedTime.value;
                            },
                          );
                        },
                      ),
                    ],
                  )
                ]),
          ],
        ));
  }
}

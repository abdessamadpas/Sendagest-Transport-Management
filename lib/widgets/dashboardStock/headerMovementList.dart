import 'package:flutter/material.dart';
import 'package:sendatrack/constant.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sendatrack/constant.dart';
import 'package:get/get.dart';
import 'package:sendatrack/controllers/stock/logMovementController.dart';

class HeaderMovementList extends StatefulWidget {
  const HeaderMovementList({super.key});

  @override
  State<HeaderMovementList> createState() => _HeaderMovementListState();
}

class _HeaderMovementListState extends State<HeaderMovementList> {
  LogMovementController controller = Get.put(LogMovementController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              margin: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                // onChanged: (value) => controller.filterSearchResults(value),
                autofocus: false,
                cursorColor: Color.fromARGB(255, 73, 73, 73),
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: TestColor, size: 20),
                  fillColor: Colors.white,
                  focusedBorder: UnderlineInputBorder(
                    // borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255), width: 0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    // borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255), width: 0),
                  ),
                ),
              ),
            ),
            const Gap(10),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            controller.changeStateShip('tanger');
                          },
                          child: Container(
                            // color: Colors.black38,
                            alignment: Alignment.center,
                            height: 40,
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            decoration: BoxDecoration(
                              color: controller.tangerStore.value
                                  ? TestColor
                                  : Colors.white,
                              border: Border.all(
                                  color: controller.tangerStore.value
                                      ? Colors.white
                                      : TestColor,
                                  width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'tanger',
                              style: TextStyle(
                                  color: controller.tangerStore.value
                                      ? Colors.white
                                      : TestColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15),
                            ),
                          ))),
                  const Gap(15),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            controller.changeStateShip('casa');
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            decoration: BoxDecoration(
                              color: controller.casaStore.value
                                  ? TestColor
                                  : Colors.white,
                              border: Border.all(
                                  color: controller.casaStore.value
                                      ? Colors.white
                                      : TestColor,
                                  width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'casa',
                              style: TextStyle(
                                  color: controller.casaStore.value
                                      ? Colors.white
                                      : TestColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15),
                            ),
                          ))),
                ]),
          ],
        )));
  }
}

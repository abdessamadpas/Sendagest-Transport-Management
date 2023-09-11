import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constant.dart';
import 'package:get/get.dart';
import 'package:sendatrack/controllers/stock/movementController.dart';
import 'package:sendatrack/widgets/dashboardStock/CardMovementList.dart';
import 'package:gap/gap.dart';
import 'dart:ui';

class ListMovemnt extends StatefulWidget {
  const ListMovemnt({super.key});

  @override
  State<ListMovemnt> createState() => _ListMovemntState();
}

class _ListMovemntState extends State<ListMovemnt> {
  MovementController controller = Get.put(MovementController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  // margin: const EdgeInsets.only(top: 5),
                  // width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: lightBlue1,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          //! here the icon

                          ClipRect(
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                              child: Container(
                                // padding: const EdgeInsets.all(15),
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color.fromARGB(255, 230, 227, 227)
                                        .withOpacity(0.3)),
                                child: const Center(
                                  child: Icon(Icons.store,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      size: 22),
                                ),
                              ),
                            ),
                          ),
                          const Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(controller.lisToDisplay.length.toString(),
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 100, 99, 99),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Gap(10),
                              Text(controller.input.isTrue ? 'Input' : 'Output',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 223, 223, 223),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          )
                        ],
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                      IntrinsicHeight(
                          child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Date',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 100, 99, 99),
                                  )),
                              const Gap(5),
                              Text(
                                  controller.selectedDate
                                      .toString()
                                      .split(" ")[0],
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white)),
                            ],
                          ),
                          const VerticalDivider(
                            color: Color.fromARGB(255, 255, 255, 255),
                            thickness: 1,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Warehouse',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 100, 99, 99),
                                  )),
                              const Gap(5),
                              Text(
                                  (controller.selectedDepot!.value ==
                                              "Select a value" ||
                                          controller.lisToDisplay.isEmpty)
                                      ? "Not selected"
                                      : controller.selectedDepot!.value,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white)),
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: controller.lisToDisplay.length.toString() == '0'
                      ? Text(controller.lisToDisplay.length.toString())
                      : GridView.builder(
                          itemCount: controller.lisToDisplay.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 6 / 3.1,
                                  crossAxisCount: 1,
                                  mainAxisSpacing: 20),
                          itemBuilder: (context, index) {
                            return CardMovement(
                              mouvement: controller.lisToDisplay[index],
                              index: index,
                            );
                          },
                        ),
                ),
              ]),
              // height: MediaQuery.of(context).size.height,
            ))));
  }
}

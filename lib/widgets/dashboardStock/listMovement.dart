import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constant.dart';
import 'package:get/get.dart';
import 'package:sendatrack/controllers/stock/movementController.dart';
import 'package:sendatrack/widgets/dashboardStock/cardMovementList.dart';
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
                child: SingleChildScrollView(
              // color: kGrey,
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  width: 350,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: bluedark,
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
                                child: Center(
                                  child: Icon(Icons.store,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      size: 22),
                                ),
                              ),
                            ),
                          ),
                          Gap(10),
                          Text('3 Inputs',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18,
                              ))
                        ],
                      ),
                      const Divider(
                        color: KDark,
                      ),
                      IntrinsicHeight(
                          child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Date',
                                  style: TextStyle(
                                      fontSize: 15, color: lightBlue)),
                              Text('12/12/2021',
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
                            children: const [
                              Text('Werehouse',
                                  style: TextStyle(
                                      fontSize: 15, color: lightBlue)),
                              Text('Tanger',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white)),
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                ),
                controller.listMovement.length == 0
                    ? Text(controller.listMovement.length.toString())
                    : GridView.builder(
                        itemCount: controller.listMovement.length,
                        // physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 3 / 3.1,
                                crossAxisCount: 1,
                                mainAxisSpacing: 20),
                        itemBuilder: (context, index) {
                          return CardMovement(
                              mouvement: controller.listMovement[index]);
                        },
                      )
              ]),
              // height: MediaQuery.of(context).size.height,
            ))));
  }
}

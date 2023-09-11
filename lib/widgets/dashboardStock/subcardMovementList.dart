import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sendatrack/constant.dart';
import 'package:sendatrack/model/movement.dart';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:sendatrack/controllers/stock/movementController.dart';

class SubCardMovement extends StatefulWidget {
  final mouvement;
  final index;
  SubCardMovement({super.key, required this.mouvement, required this.index});

  @override
  State<SubCardMovement> createState() => _SubCardMovementState();
}

MovementController controller = Get.put(MovementController());

class _SubCardMovementState extends State<SubCardMovement> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: <Color>[lightBlue1, lightBlue2]),
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: lightBlue1,
        ),
        child: Column(children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(widget.mouvement["Reference"],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                            ClipRect(
                              child: Container(
                                width: 60.0,
                                height: 50.0,
                                child: const Center(
                                  child: Icon(
                                    Icons.sports_motorsports,
                                    color: kGrey,
                                    size: 50,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              widget.mouvement["id_TypePanne"],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text("designation : ",
                                    style: TextStyle(
                                      color: TestColor,
                                    )),
                                Text(widget.mouvement["Designation"],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("quantity : ",
                                    style: TextStyle(
                                      color: TestColor,
                                    )),
                                Text(widget.mouvement["Qte"],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Price : ",
                                    style: TextStyle(
                                      color: TestColor,
                                    )),
                                Text(widget.mouvement["Price"],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    )),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                            child: Container(
                              // padding: const EdgeInsets.all(15),
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromARGB(255, 230, 227, 227)
                                      .withOpacity(0.3)),
                              child: Center(
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                    color: kRed,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    controller.removeMovement(widget.index);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Text("TVA : ",
                                style: TextStyle(
                                  color: TestColor,
                                )),
                            Text(widget.mouvement["TVA"].toString() + "%",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                )),
                          ],
                        ),
                      ],
                    )
                  ]),
            ),
          ),
          Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text("Citerne",
                      style: TextStyle(
                        color: TestColor,
                      )),
                  const Gap(5),
                  Text(widget.mouvement["idCiterne"],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const Gap(20),
              Column(
                children: [
                  const Text("observation",
                      style: TextStyle(
                        color: TestColor,
                      )),
                  const Gap(5),
                  Text(widget.mouvement["observation"],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const Gap(20),
              Column(
                children: const [
                  Text("Kilometrage",
                      style: TextStyle(
                        color: TestColor,
                      )),
                  Gap(5),
                  Text("520",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          )
        ]));
    ;
  }
}

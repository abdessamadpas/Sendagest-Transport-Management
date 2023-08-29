import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sendatrack/constant.dart';
import 'package:get/get.dart';
import 'package:sendatrack/controllers/stock/stockController.dart';

class MovementCard extends StatefulWidget {
  const MovementCard({super.key});

  @override
  State<MovementCard> createState() => _MovementCardState();
}

class _MovementCardState extends State<MovementCard> {
  StockController stockController = Get.put(StockController());

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1.0, color: Color.fromARGB(255, 224, 224, 224))),
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(children: [
          Container(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Designation',
                            style: TextStyle(
                                color: Color.fromARGB(255, 122, 122, 122),
                                fontWeight: FontWeight.w400,
                                fontSize: 14)),
                        Text('designation',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w500,
                                fontSize: 15))
                      ],
                    )),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: kGrey,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('TVA',
                          style: TextStyle(
                              color: Color.fromARGB(255, 122, 122, 122),
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                      Text('TVA',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500,
                              fontSize: 15))
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('citerne',
                          style: TextStyle(
                              color: Color.fromARGB(255, 122, 122, 122),
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                      Text('citerne',
                          style: const TextStyle(
                              color: kGreen,
                              fontWeight: FontWeight.w500,
                              fontSize: 15))
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: kGrey,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('observation',
                          style: TextStyle(
                              color: Color.fromARGB(255, 122, 122, 122),
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                      Text('observation',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500,
                              fontSize: 15))
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('vehicule id',
                          style: TextStyle(
                              color: Color.fromARGB(255, 122, 122, 122),
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                      Text('vehicule id',
                          style: const TextStyle(
                              color: kGreen,
                              fontWeight: FontWeight.w500,
                              fontSize: 15))
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: kGrey,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('type de pane',
                          style: TextStyle(
                              color: Color.fromARGB(255, 122, 122, 122),
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                      Text('type de pane',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500,
                              fontSize: 15))
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('kilometrage',
                          style: TextStyle(
                              color: Color.fromARGB(255, 122, 122, 122),
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                      Text('kilometrage',
                          style: const TextStyle(
                              color: kGreen,
                              fontWeight: FontWeight.w500,
                              fontSize: 15))
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sendatrack/model/movement.dart';
import '../../../constant.dart';
import 'rowFill.dart';
import 'rowInFill.dart';

class CardMovement extends StatefulWidget {
  final Movement mouvement;
  CardMovement({super.key, required this.mouvement});

  @override
  State<CardMovement> createState() => _CardMovementState();
}

class _CardMovementState extends State<CardMovement> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1.0, color: Color.fromARGB(255, 224, 224, 224))),
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: const [
                        Icon(
                          Icons.input_rounded,
                          color: TestColor,
                        ),
                        const Gap(5),
                        Text(' input ',
                            style: TextStyle(
                                color: TestColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 16))
                      ],
                    ),
                  ),
                  const Text('Casa',
                      style: TextStyle(
                          color: KDark,
                          fontWeight: FontWeight.w600,
                          fontSize: 15))
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                RowFill(label: 'Reference', value: "10-06-2023", fill: true),
                RowFill(label: 'Designation', value: "10-06-2023", fill: false),
              ],
            ),
          )
        ]));
    ;
  }
}

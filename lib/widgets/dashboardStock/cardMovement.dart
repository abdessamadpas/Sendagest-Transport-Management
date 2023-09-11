import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../constant.dart';
import 'package:gap/gap.dart';
import 'package:sendatrack/widgets/dashboardStock/subcardMovementList.dart';

class CardMovemet extends StatefulWidget {
  final index;
  final mouvement;
  const CardMovemet({super.key, required this.index, required this.mouvement});

  @override
  State<CardMovemet> createState() => _CardMovemetState();
}

class _CardMovemetState extends State<CardMovemet> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ExpansionTile(
        collapsedBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                      child: Container(
                        // padding: const EdgeInsets.all(15),
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 210, 241, 255)
                                .withOpacity(0.3)),
                        child: const Center(
                          child: Text('O',
                              style: TextStyle(
                                  color: kDarkBlue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                  Gap(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Reference",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          )),
                      Gap(7),
                      Text(
                        "20 unit",
                        style: TextStyle(
                          fontSize: 14,
                          color: lightGray,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Tanger",
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w400, color: lightGray),
            ),
            Gap(7),
            Text("12Nov-2023",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
          ],
        ),
        children: [
          ListTile(
            onTap: () {},
            title: SubCardMovement(
                index: widget.index, mouvement: widget.mouvement),
          )
        ],
      ),
    );
  }
}

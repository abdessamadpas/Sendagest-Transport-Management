import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sendatrack/constant.dart';
import 'dart:ui';
import 'package:flutter/material.dart';

class CardQuickAccess extends StatefulWidget {
  IconData icon;
  String title;
  String route;
  Color color;
  CardQuickAccess(
      {super.key,
      required this.icon,
      required this.title,
      required this.route,
      required this.color});

  @override
  State<CardQuickAccess> createState() => _CardQuickAccessState();
}

class _CardQuickAccessState extends State<CardQuickAccess> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            widget.color,
            KBlueChip,
          ],
        ),
        borderRadius: BorderRadius.circular(16.0),

        //  color :  widget.color,

        // Adjust the radius as needed
        // border: Border.all(
        //     width: 1.0, color: Colors.grey), // Optional: Add a border
        // color: Color.fromARGB(57, 155, 222, 255),
      ),
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
                      child: Icon(widget.icon,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          size: 22),
                    ),
                  ),
                ),
              ),
              Gap(10),
              Text(widget.title,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          IconButton(
              icon: const Icon(Icons.more_vert,
                  color: Color.fromARGB(255, 160, 160, 160), size: 25),
              onPressed: () {
                Get.toNamed('${widget.route}');
              }),
        ],
      ),
    );
  }
}

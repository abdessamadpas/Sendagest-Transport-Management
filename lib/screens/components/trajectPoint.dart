import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sendatrack/constant.dart';
import 'package:sendatrack/model/trajects_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:sendatrack/widgets/verticalDashedLine.dart';

class TrajectPoint extends StatefulWidget {
  const TrajectPoint({super.key});

  @override
  State<TrajectPoint> createState() => _TrajectPointState();
}

class _TrajectPointState extends State<TrajectPoint> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      color: Color.fromARGB(255, 255, 255, 255),
      child: Row(
        children: [
          Column(
            children: [
              const Icon(
                Icons.circle,
                color: kDarkBlue,
                size: 20,
              ),
              Expanded(
                //? dashed line
                child: CustomPaint(
                  painter: DashedLinePainter(
                    color: const Color.fromARGB(255, 195, 195,
                        195), // Specify the color of the dashed line
                    strokeWidth: 2.0, // Adjust the stroke width as needed
                    dashWidth: 5.0, // Adjust the width of each dash as needed
                    dashSpace: 5.0, // Adjust the space between dashes as needed
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              width: 2,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "12/12/2021  08:00 AM",
                      style: TextStyle(
                        fontSize: 15,
                        //  fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(92, 126, 209, 244),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                      child: Text('city name  -  country name'),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}

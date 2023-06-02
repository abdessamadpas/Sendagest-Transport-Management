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
  final String city;

  const TrajectPoint({required this.city, super.key});

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
                //! dashed line
                child: CustomPaint(
                  painter: DashedLinePainter(
                    color: Color.fromARGB(92, 49, 121,
                        255), // Specify the color of the dashed line
                    strokeWidth: 2.0, // Adjust the stroke width as needed
                    dashWidth: 2.0, // Adjust the width of each dash as needed
                    dashSpace: 5.0, // Adjust the space between dashes as needed
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 25.w,
          ),
          Expanded(
            child: Container(
              width: 2,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "12/12/2023",
                      style: TextStyle(
                        fontSize: 15,
                        //  fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(56, 126, 209, 244),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                      child: Text(widget.city,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            //  fontWeight: FontWeight.bold
                          )),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}

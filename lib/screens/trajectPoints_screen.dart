import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:sendatrack/constant.dart';
import 'package:sendatrack/screens/components/trajectPoint.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PointsTrajectScreen extends StatefulWidget {
  final List cities;
  final String? numName;
  const PointsTrajectScreen(
      {required this.cities, required this.numName, super.key});

  @override
  State<PointsTrajectScreen> createState() => _PointsTrajectScreenState();
}

class _PointsTrajectScreenState extends State<PointsTrajectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Color.fromARGB(0, 252, 252, 252),
        //   elevation: 0,
        //   leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: const Icon(Icons.arrow_back),
        //     color: Colors.black,
        //     iconSize: 32,
        //   ),
        //   actions: [
        //     IconButton(
        //       onPressed: () {},
        //       icon: const Icon(Icons.more_vert),
        //       color: Colors.black,
        //       iconSize: 32,
        //     ),
        //   ],
        // ),
        body: Stack(
      children: [
        SingleChildScrollView(
            child: SafeArea(
                child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: TestColor,
                ),
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: 150.h,
                  bottom: 150.h,
                ),
                child: Center(
                  child: Text(
                    'Traject number : ${widget.numName}',
                    style: const TextStyle(
                      letterSpacing: 1, //letter spacing

                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 233, 234, 237),
                    ),
                  ),
                ),
              ),
              Container(
                  child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: widget.cities.map((
                    city,
                  ) {
                    return TrajectPoint(city: city);
                  }).toList(),
                ),
              ))
            ],
          ),
        ))),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBar(
            backgroundColor: Color.fromARGB(0, 255, 255, 255),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
              iconSize: 32,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
                color: Colors.black,
                iconSize: 32,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

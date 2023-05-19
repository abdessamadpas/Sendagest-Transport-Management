// ignore_for_file: prefer_const_constructors

import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:sendatrack/data/data.dart';
import 'package:flutter/material.dart';
import 'package:sendatrack/screens/details_trajects.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendatrack/widgets/line_dash.dart';
import 'package:sendatrack/constant.dart';

class ProjectsGrid extends StatelessWidget {
  const ProjectsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GridView.builder(
        itemCount: planing.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 9 / 4.1, crossAxisCount: 1, mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(15.0), // Adjust the radius as needed
                // border: Border.all(
                //     width: 1.0, color: Colors.grey), // Optional: Add a border
                color: Color.fromARGB(57, 155, 222, 255)),
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width * 0.66,
                        height: 200.h,
                        padding: EdgeInsets.all(5),
                        //color: Color.fromARGB(255, 247, 122, 76),
                        child: FractionallySizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "CR2200287 ",
                                style: TextStyle(
                                    fontSize: 47.sp,
                                    color: TestColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Ksar Sghir - Tanger',
                                style: TextStyle(
                                    fontSize: 65.sp,
                                    color: DarkBlueTest,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " BRICOSTAR",
                                style: TextStyle(
                                    fontSize: 47.sp,
                                    color: TestColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            height: 150.h,
                            width: 95.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'D',
                                  style: TextStyle(
                                    color: kGreen,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    //fontWeight: FontWeight.bold
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          width: 25.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          height: 150.h,
                          width: 95.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.gps_fixed_rounded,
                                color: kDarkBlue,
                                size: 24.0,
                                semanticLabel:
                                    'Text to announce in accessibility modes',
                              ),
                            ],
                          ),
                        ),
                      ])
                    ],
                  ),
                ),

                //! MySeparator(color: Colors.grey),
                const MySeparator(color: Color.fromARGB(143, 163, 169, 250)),

                Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            '6257B40',
                            style: TextStyle(color: TestColor),
                          ),
                          Text(
                            '7667-08',
                            style: TextStyle(color: TestColor),
                          ),
                          Text(
                            'BAJNOUNI',
                            style: TextStyle(color: TestColor),
                          ),
                        ],
                      )),
                      Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.av_timer_outlined,
                                  color: kDarkBlue,
                                  size: 20,
                                ),
                                Text(
                                  '14:5',
                                  style: TextStyle(color: TestColor),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.date_range_rounded,
                                  color: kDarkBlue,
                                  size: 20,
                                ),
                                Text(
                                  '07/07/2021',
                                  style: TextStyle(color: TestColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}

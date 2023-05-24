import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sendatrack/constant.dart';
import 'package:sendatrack/model/trajects_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class DetailsTraject extends StatefulWidget {
  final Traject traject;

  DetailsTraject({required this.traject, Key? key}) : super(key: key);

  @override
  State<DetailsTraject> createState() => _DetailsTrajectState();
}

class _DetailsTrajectState extends State<DetailsTraject>
    with TickerProviderStateMixin {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(35.262956, -5.561728);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(_mapStyle);
  }

  late TabController _tabController;
  String? _mapStyle;

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('styles/map_style.json').then((string) {
      _mapStyle = string;
    });
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 2,
        // ),
        body: Stack(children: [
          Container(
            margin: EdgeInsets.only(top: 10.h),
            padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
            child: Column(children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 163, 218, 255).withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: GoogleMap(
                      zoomControlsEnabled: false,
                      //remove location button
                      myLocationButtonEnabled: false,
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 8.0,
                      ),
                      markers: Set<Marker>.from([]),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 60.w, right: 60.w, top: 10.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "trip details",
                          style: TextStyle(
                              fontSize: 40.sp, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text("See all",
                                style: TextStyle(
                                    fontSize: 40.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_sharp),
                              color: Colors.black,
                              iconSize: 32,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22.0),
                        color: Color.fromARGB(92, 126, 209, 244),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://images.unsplash.com/photo-1500522144261-ea64433bbe27?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTh8fHdvbWVufGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Driver name",
                                        style: TextStyle(
                                            fontSize: 45.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("time start",
                                          style: TextStyle(
                                            fontSize: 40.sp,
                                          )),
                                      Text("truck number",
                                          style: TextStyle(
                                            fontSize: 40.sp,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                                child: TextButton(
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color.fromARGB(255, 255, 255, 255)),
                                  backgroundColor:
                                      MaterialStateProperty.all(kDarkBlue),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  )),
                              onPressed: () {},
                              child: const Text('see Profile',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),
                            )),
                          ]),
                    )
                  ],
                ),
              ),
            ]),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 0,
            height: 200.h,
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: TextButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 255, 255, 255)),
                        backgroundColor: MaterialStateProperty.all(kDarkBlue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        )),
                    onPressed: () {},
                    child: const Text('Cancel Traject',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255))),
                  ),
                )),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
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
        ]));
  }
}

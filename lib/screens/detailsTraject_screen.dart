import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sendatrack/constant.dart';
import 'package:sendatrack/model/trajects_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:sendatrack/widgets/verticalDashedLine.dart';
import 'package:sendatrack/screens/components/trajectPoint.dart';
import 'package:sendatrack/screens/trajectPoints_screen.dart';

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

  List getCities(String libelleTrajet) {
    List<String> cities =
        libelleTrajet.split(">").map((city) => city.trim()).toList();
    return cities;
  }

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
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top: 10.h),
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Column(children: [
                widget.traject.Statut == "DEMARRER"
                    ? Expanded(
                        flex: 3,
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25.0),
                                  bottomRight: Radius.circular(25.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 163, 218, 255)
                                      .withOpacity(0.5),
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
                                //remove google logo
                                mapToolbarEnabled: false,
                                //remove zoom button

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
                            )))
                    : SafeArea(
                        child: Container(
                          child: Text(
                            widget.traject.Num_Trajet,
                            style: TextStyle(
                                fontSize: 50.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                // const SizedBox(
                //   height: 10,
                // ),
                Expanded(
                  flex: 7,
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 35.w, right: 35.w, top: 30.h),
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
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 200.h,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22.0),
                            color: Color.fromARGB(92, 126, 209, 244),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 150.w,
                                      height: 150.h,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image.asset(
                                              "images/driver2.jpg")),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Text(
                                          widget.traject.Chauffeur,
                                          style: TextStyle(
                                              fontSize: 45.sp,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        Expanded(
                                            child: Text(widget.traject.Vehicule,
                                                style: TextStyle(
                                                  fontSize: 40.sp,
                                                ))),
                                        Expanded(
                                            child: Text(widget.traject.Remorque,
                                                style: TextStyle(
                                                  fontSize: 40.sp,
                                                ))),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: TestColor,
                                      ),
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text('See profile',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255))),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                                Icons.arrow_forward_sharp),
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                            iconSize: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Current schedule",
                              style: TextStyle(
                                  fontSize: 40.sp, fontWeight: FontWeight.bold),
                            ),

                            //? current schedule header
                            // ElevatedButton(
                            //   onPressed: () {
                            //     // Handle button press
                            //     print('driver profile button pressed');
                            //   },
                            //   style: ElevatedButton.styleFrom(
                            //     padding: EdgeInsets.all(16.0),
                            //     textStyle: TextStyle(fontSize: 20),
                            //     primary: Colors
                            //         .transparent, // Set background color to transparent
                            //     elevation:
                            //         0, // Set elevation to 0 to remove the shadow
                            //   ),
                            //   child: Row(
                            //     mainAxisSize: MainAxisSize.min,
                            //     children: [
                            //       Text("See all",
                            //           style: TextStyle(
                            //               fontSize: 40.sp,
                            //               fontWeight: FontWeight.bold,
                            //               color: Colors.black)),
                            //       SizedBox(width: 8.0),
                            //       Icon(Icons.arrow_forward_sharp,
                            //           size: 20, color: Colors.black),
                            //     ],
                            //   ),
                            // ),
                            //! see all button arg : cities
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return PointsTrajectScreen(
                                      cities: getCities(
                                          widget.traject.libelletrajet),
                                      numName: widget.traject.Num_Trajet,
                                    );
                                  }),
                                );
                              },
                              child: Container(
                                padding:
                                    EdgeInsets.only(top: 15.h, bottom: 15.h),
                                child: Row(
                                  children: [
                                    Text("See all",
                                        style: TextStyle(
                                            fontSize: 40.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                    const Icon(Icons.arrow_forward_sharp,
                                        size: 20, color: Colors.black),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),

                        //? current schedule list
                        Expanded(
                          child: Container(
                            child: SingleChildScrollView(
                              child: Column(
                                children:
                                    getCities(widget.traject.libelletrajet)
                                        .map((city) {
                                  return TrajectPoint(city: city);
                                }).toList(),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            ),
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
                child: widget.traject.Statut == "DEMARRER"
                    ? null
                    : widget.traject.Statut == "ENCOURS"
                        ? Container(
                            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                  style: ButtonStyle(
                                      padding:
                                          MaterialStateProperty.all<EdgeInsets>(
                                              const EdgeInsets.fromLTRB(
                                                  50, 15, 50, 15)),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color.fromARGB(0, 255, 255, 255)),
                                      backgroundColor:
                                          MaterialStateProperty.all(TestColor),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                        ),
                                      )),
                                  onPressed: () {},
                                  child: const Text('Confirm',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255))),
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                      padding:
                                          MaterialStateProperty.all<EdgeInsets>(
                                              const EdgeInsets.fromLTRB(
                                                  50, 15, 50, 15)),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color.fromARGB(0, 255, 255, 255)),
                                      backgroundColor:
                                          MaterialStateProperty.all(TestColor),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                        ),
                                      )),
                                  onPressed: () {},
                                  child: const Text('Cancel',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255))),
                                ),
                              ],
                            ))
                        : widget.traject.Statut == "CONFIRMER"
                            ? Container(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 0, 30, 0),
                                child: TextButton(
                                  style: ButtonStyle(
                                      padding:
                                          MaterialStateProperty.all<EdgeInsets>(
                                              const EdgeInsets.fromLTRB(
                                                  50, 10, 50, 10)),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color.fromARGB(0, 255, 255, 255)),
                                      backgroundColor:
                                          MaterialStateProperty.all(TestColor),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                        ),
                                      )),
                                  onPressed: () {},
                                  child: const Text('Cancel',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255))),
                                ),
                              )
                            : null),
          ),
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
        ]));
  }
}

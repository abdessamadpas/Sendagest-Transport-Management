// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:sendatrack/screens/components/chart_container.dart';
import 'package:sendatrack/widgets/activity_header.dart';
import 'package:sendatrack/widgets/bar_chart.dart';
import 'package:sendatrack/widgets/courses_grid.dart';
import 'package:sendatrack/widgets/projects_grid.dart';
import 'package:sendatrack/widgets/statistics_grid.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import '../constant.dart';
import '../widgets/trajects_header.dart';
import '../screens/components/side_menu.dart';
import 'trajects_screen.dart';
import 'package:sendatrack/screens/components/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Colors.grey, size: 28),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, right: 16, bottom: 5),
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1500522144261-ea64433bbe27?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTh8fHdvbWVufGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
                ),
              )
            ],
            bottom: TabBar(
                indicatorColor: Color.fromARGB(255, 52, 64, 171),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3,
                tabs: [
                  Tab(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kDarkBlue.withOpacity(.1),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(-20, -20),
                            blurRadius: 60,
                            color: Color.fromRGBO(255, 255, 255, 0.675),
                            inset: true,
                          ),
                          BoxShadow(
                            offset: Offset(8, 20),
                            color: kDarkBlue,
                            spreadRadius: -13.0,
                            blurRadius: 12.0,
                          ),
                        ],
                      ),
                      child: Icon(
                        FontAwesomeIcons.house,
                        color: kDarkBlue,
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kDarkBlue.withOpacity(.1),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(-20, -20),
                            blurRadius: 60,
                            color: Color.fromRGBO(255, 255, 255, 0.675),
                            inset: true,
                          ),
                          BoxShadow(
                            offset: Offset(8, 20),
                            color: kDarkBlue,
                            spreadRadius: -13.0,
                            blurRadius: 12.0,
                          ),
                        ],
                      ),
                      child: Icon(
                        FontAwesomeIcons.mapMarkedAlt,
                        color: kDarkBlue,
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kDarkBlue.withOpacity(.1),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(-20, -20),
                            blurRadius: 60,
                            color: Color.fromRGBO(255, 255, 255, 0.675),
                            inset: true,
                          ),
                          BoxShadow(
                            offset: Offset(8, 20),
                            color: kDarkBlue,
                            spreadRadius: -13.0,
                            blurRadius: 12.0,
                          ),
                        ],
                      ),
                      child: Icon(
                        FontAwesomeIcons.car,
                        color: kDarkBlue,
                      ),
                    ),
                  ),
                ]),
          ),
          backgroundColor: Colors.white,
          drawer: const SideMenu(),
          body: TabBarView(
            children: [
              Home(),
              Trajects(),
              test('context'),
            ],
          ),
        ));
  }

  Widget test(String text) => Center(
        child: Text(text),
      );
}

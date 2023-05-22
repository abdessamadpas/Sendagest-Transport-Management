import 'package:sendatrack/screens/components/chart_container.dart';
import 'package:sendatrack/widgets/activity_header.dart';
import 'package:sendatrack/widgets/bar_chart.dart';
import 'package:sendatrack/widgets/projects_grid.dart';
import 'package:sendatrack/widgets/statistics_grid.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import '../../constant.dart';
import '../../widgets/trajects_header.dart';
import '../../screens/components/side_menu.dart';
import '../trajects_screen.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RichText(
                text: const TextSpan(
                  text: "Hello ",
                  style: TextStyle(color: kDarkBlue, fontSize: 20),
                  children: [
                    TextSpan(
                      text: "PAS",
                      style: TextStyle(
                          color: kDarkBlue, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ", welcome back!",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Statistics",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              const StatisticsGrid(),
              const SizedBox(
                height: 15,
              ),
              const ActivityHeader(),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "completed trajects",
                style: TextStyle(
                    fontSize: 13,
                    color: kDarkBlue,
                    fontWeight: FontWeight.w500),
              ),
              const ChartContainer(chart: BarChartContent()),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "completed trajects",
                style: TextStyle(
                    fontSize: 13,
                    color: kDarkBlue,
                    fontWeight: FontWeight.w500),
              ),
              const ChartContainer(chart: BarChartContent())
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../constant.dart';
import 'package:sendatrack/widgets/dashboardStock/cardActivity.dart';
import 'package:sendatrack/widgets/dashboardStock/cardQuickAccess.dart';

class StockDashboardScreen extends StatefulWidget {
  const StockDashboardScreen({super.key});

  @override
  State<StockDashboardScreen> createState() => _StockDashboardScreenState();
}

class _StockDashboardScreenState extends State<StockDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                color: Color.fromARGB(255, 255, 255, 255),
                padding: EdgeInsets.all(20),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Welcome To",
                                  style: TextStyle(
                                      color: KDark,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                              Text("Stock Manager!",
                                  style: TextStyle(
                                      color: KDark,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold))
                            ]),
                        IconButton(
                            onPressed: () {
                              Get.toNamed('home');
                            },
                            icon: const Icon(Icons.home_max_rounded,
                                color: KDark, size: 30)),
                      ],
                    ),
                    const Gap(30),
                    // const Text("Activities Stock",
                    //     style: TextStyle(
                    //         fontSize: 20, fontWeight: FontWeight.bold)),

                    Row(
                      children: [
                        CardActivity(
                          title: "stock ",
                          icon: Icons.storage_rounded,
                          value: "100",
                          percent: "",
                        ),
                        Gap(10),
                        CardActivity(
                          title: "products ",
                          icon: Icons.production_quantity_limits_outlined,
                          value: "2.085",
                          percent: " + 5%",
                        ),
                      ],
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        CardActivity(
                          title: "input ",
                          icon: Icons.keyboard_arrow_up_rounded,
                          value: "100",
                          percent: "10%",
                        ),
                        Gap(10),
                        CardActivity(
                          title: "output ",
                          icon: Icons.keyboard_arrow_down_rounded,
                          value: "150",
                          percent: "17%",
                        ),
                      ],
                    ),
                    const Gap(30),
                    const Text("Quick Access",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const Gap(10),
                    Expanded(
                        child: Column(
                      children: [
                        CardQuickAccess(
                          icon: Icons.stacked_bar_chart,
                          title: "Statistics Stock",
                          route: "stock",
                          color: DarkBlueTest,
                        ),
                        const Gap(10),
                        CardQuickAccess(
                          icon: Icons.local_activity_outlined,
                          title: "Logs Stock",
                          route: "stock",
                          color: DarkBlueTest,
                        ),
                        const Gap(10),
                        CardQuickAccess(
                          icon: Icons.add_circle_outline,
                          title: "Add movement Stock",
                          route: "/movement",
                          color: DarkBlueTest,
                        ),
                      ],
                    ))
                  ],
                ))));
  }
}

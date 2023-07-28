import 'package:flutter/material.dart';
import 'dart:ui';
import '../../../constant.dart';
import 'package:sendatrack/screens/managementStockScreen/dashboardStockScreen.dart';
import 'package:get/get.dart';
import 'package:sendatrack/widgets/dashboardStock/formMovement.dart';

class MovementScreen extends StatefulWidget {
  const MovementScreen({super.key});

  @override
  State<MovementScreen> createState() => _MovementScreenState();
}

class _MovementScreenState extends State<MovementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white.withAlpha(200),
          title: const Text(
            'Add Movement',
            style: TextStyle(color: kGrayIcon, fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: kGrayIcon,
            onPressed: () {
              // Navigator.pop(context);
              Get.off(() => const StockDashboardScreen()
                  //  , transition: Transition.rightToLeft
                  );
            },
          ),
        ),
        body: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                // TabBar(
                //   tabs: [
                //     Tab(icon: Icon(Icons.directions_car)),
                //     Tab(icon: Icon(Icons.directions_transit)),
                //   ],
                // ),
                Expanded(
                  child: TabBarView(
                    children: [
                      FormMovement(),
                      Icon(Icons.directions_transit),
                    ],
                  ),
                )
              ],
            )));
  }
}

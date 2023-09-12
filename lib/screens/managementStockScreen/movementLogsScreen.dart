import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../constant.dart';
import 'package:sendatrack/screens/managementStockScreen/dashboardStockScreen.dart';
import 'package:get/get.dart';
import 'package:sendatrack/widgets/dashboardStock/movementCard.dart';
import 'package:sendatrack/widgets/dashboardStock/headerMovementList.dart';
import 'package:sendatrack/controllers/stock/logMovementController.dart';
import 'package:sendatrack/widgets/dashboardStock/cardMovement.dart';

class MovementLogsScreen extends StatefulWidget {
  const MovementLogsScreen({super.key});

  @override
  State<MovementLogsScreen> createState() => _MovementLogsScreenState();
}

class _MovementLogsScreenState extends State<MovementLogsScreen> {
  LogMovementController controller = Get.put(LogMovementController());

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
            'Movement List',
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
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderMovementList(),
            Obx(
              () => controller.isLoading.isFalse
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: controller.stockListFiltered.length,
                        itemBuilder: (context, index) {
                          return CardMovemet(
                              index: index,
                              mouvement: controller.stockListFiltered[index]);
                        },
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
            )
          ],
        )));
  }
}

import 'package:flutter/material.dart';
// import 'package:sendatrack/widgets/stockHeader.dart';
import 'package:sendatrack/widgets/stockBody.dart';
import '../../constant.dart';
import 'package:sendatrack/widgets/stockHeader.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({super.key});

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
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
          'Stock statistics',
          style: TextStyle(color: kGrayIcon, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: kGrayIcon,
              size: 30,
            ),
            tooltip: 'Filter',
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: kGrayIcon,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            StockHeader(),
            StockBody(),
          ],
        ),
      ),
    );
  }
}

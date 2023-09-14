import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../constant.dart';
import 'package:get/get.dart';
import 'package:sendatrack/widgets/consomationForm.dart';

class ConsommationScreen extends StatefulWidget {
  const ConsommationScreen({super.key});

  @override
  State<ConsommationScreen> createState() => ConsommationScreenState();
}

class ConsommationScreenState extends State<ConsommationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consommation'),
      ),
      body: Container(
        child: const Center(
          child: Text('Consommation'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const ConsomationForm());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

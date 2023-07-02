// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sendatrack/screens/main_screen.dart';
import 'package:sendatrack/widgets/textFormField.dart';
import '../constant.dart';
import 'package:blurry/blurry.dart';
import 'package:get/get.dart';
import '../controllers/addTraject.dart';

class AddTraject extends GetView<AddTrajectController> {
  final AddTrajectController controller = Get.put(AddTrajectController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white.withAlpha(200),
        title: const Text('Add Traject',
            style: TextStyle(color: DarkBlueTest, fontWeight: FontWeight.w800)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Blurry.info(
                title: 'add traject',
                description:
                    'are you sure you want to add this traject to your list ?',
                confirmButtonText: 'Confirm',
                onConfirmButtonPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
                },
                barrierColor: Colors.white.withOpacity(0.7),
                dismissable: false,
              ).show(context);
            },
            child: const Text('Save',
                style: TextStyle(color: Colors.black, fontSize: 16)),
          ),
        ],
      ),
      body: Obx(() => Stepper(
            type: StepperType.horizontal,
            steps: buildStep(),
            currentStep: controller.currentStep.value,
            onStepContinue: () {
              if (controller.currentStep.value == buildStep().length - 1) {
                print("Send data to server");
              } else {
                controller.currentStep.value++;
              }
            },
            onStepCancel: () {
              controller.currentStep.value == 0
                  ? null
                  : controller.currentStep.value--;
            },
            onStepTapped: (index) {
              controller.currentStep.value = index;
            },
          )),
    );
  }

  List<Step> buildStep() {
    return [
      Step(
          title: Text('traject details'),
          content: Container(
              height: 100, color: Colors.red, child: Text('traject details')),
          isActive: controller.currentStep.value >= 0,
          state: controller.currentStep.value > 0
              ? StepState.complete
              : StepState.indexed),
      Step(
          title: Text('driver'),
          content: Container(
            height: 100,
            color: Colors.green,
          ),
          isActive: controller.currentStep.value >= 1,
          state: controller.currentStep.value > 1
              ? StepState.complete
              : StepState.indexed),
      Step(
          title: Text('steps'),
          content: Container(
            height: 100,
            color: Colors.deepPurpleAccent,
          ),
          isActive: controller.currentStep.value >= 2)
    ];
  }
}

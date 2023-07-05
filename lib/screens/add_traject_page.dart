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
            controlsBuilder:
                (BuildContext context, ControlsDetails controlsDetails) {
              return Row(
                children: [
                  if (controlsDetails.onStepContinue != null &&
                      controller.currentStep.value < buildStep().length - 1)
                    ElevatedButton(
                      onPressed: controlsDetails.onStepContinue,
                      child: Icon(Icons.arrow_forward),
                    ),
                  if (controlsDetails.onStepContinue != null &&
                      controller.currentStep.value == buildStep().length - 1)
                    ElevatedButton(
                      onPressed: controlsDetails.onStepContinue,
                      child: Icon(Icons.check),
                    ),
                  if (controlsDetails.onStepCancel != null &&
                      controller.currentStep.value > 0)
                    ElevatedButton(
                      onPressed: controlsDetails.onStepCancel,
                      child: Icon(Icons.arrow_back),
                    ),
                ],
              );
            },
          )),
    );
  }

  List<Step> buildStep() {
    return [
      Step(
        title: CustomStepTitle(
          icon: Icon(Icons.person),
          text: Text('Step 1'),
        ),
        content: Text('Content of Step 1'),
        isActive: true,
        state: StepState.indexed,
      ),
      Step(
        title: CustomStepTitle(
          icon: Icon(Icons.business),
          text: Text('Step 2'),
        ),
        content: Text('Content of Step 2'),
        isActive: true,
        state: StepState.indexed,
      ),
      Step(
        title: CustomStepTitle(
          icon: Icon(Icons.check_circle),
          text: Text('Step 3'),
        ),
        content: Text('Content of Step 3'),
        isActive: true,
        state: StepState.indexed,
      ),
    ];
  }
}

class CustomStepTitle extends StatelessWidget {
  final Icon icon;
  final Text text;

  const CustomStepTitle({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(width: 8),
        text,
      ],
    );
  }
}

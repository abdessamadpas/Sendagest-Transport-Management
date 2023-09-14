import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../constant.dart';
import 'package:get/get.dart';
import 'package:sendatrack/widgets/dashboardStock/label.dart';
import 'package:sendatrack/widgets/dashboardStock/ship.dart';
import 'package:sendatrack/widgets/dashboardStock/pickerdate.dart';
import 'package:sendatrack/widgets/dashboardStock/selectInput.dart';
import 'package:sendatrack/widgets/dashboardStock/inputCustom.dart';
import 'package:get/get.dart';
import 'package:sendatrack/controllers/maintenance/gestionCarburant.dart';
import 'package:sendatrack/screens/managementStockScreen/dashboardStockScreen.dart';
import 'dart:ui';
import '../../../constant.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ConsomationForm extends StatefulWidget {
  const ConsomationForm({super.key});

  @override
  State<ConsomationForm> createState() => _ConsomationFormState();
}

class _ConsomationFormState extends State<ConsomationForm> {
  GestionCarburantController controller = Get.put(GestionCarburantController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => !controller.isLoading.value
        ? Scaffold(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
                'Add Consommation Carburant',
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
            body: SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Label(text: "General", main: true),
                    Divider(color: Colors.black),
                    Gap(10),
                    //todo:  type of movement

                    //todo:  date of movement
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Label(text: "Date", main: false),
                        const Gap(20),
                        const Pickerdate()
                      ],
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Label(text: "Matricule", main: false),
                        const Gap(20),
                        SelectInput(
                            list: controller.ListMatricules, type: "matricules")
                      ],
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Label(text: "Conducteur", main: false),
                        const Gap(20),
                        SelectInput(
                            list: controller.ListConducteur, type: "Conducteur")
                      ],
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Label(text: "Km precedent", main: false),
                        const Gap(20),
                        InputCustom(
                            hint: "Km precedent",
                            controllerInput:
                                controller.KmPrecedentTextEditingController,
                            numeric: true),
                      ],
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Label(text: "Km actuel", main: false),
                        const Gap(20),
                        InputCustom(
                            hint: "Km actuel",
                            controllerInput:
                                controller.KmActuelTextEditingController,
                            numeric: true),
                      ],
                    ),
                    const Gap(20),

                    Label(text: "Type", main: false),
                    Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Ship(text: "Internal"),
                        Gap(10),
                        Ship(text: "External")
                      ],
                    ),
                    const Gap(20),
                    controller.input.value
                        ? Label(text: "Internal", main: true)
                        : Label(text: "External", main: true),
                    const Divider(color: Colors.black),
                    //! if type is  input
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Label(text: "Citerne", main: false),
                        const Gap(20),
                        SelectInput(
                            list: controller.ListCiternes, type: "Citernes")
                      ],
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Label(text: "Km precedent", main: false),
                        const Gap(20),
                        InputCustom(
                            hint: "Km precedent",
                            controllerInput:
                                controller.KmPrecedentTextEditingController,
                            numeric: true),
                      ],
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Label(text: "Qte (L)", main: false),
                        const Gap(20),
                        InputCustom(
                            hint: "Qte L",
                            controllerInput:
                                controller.QteTextEditingController,
                            numeric: true),
                      ],
                    ),
                    const Gap(20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Label(text: "plien", main: false),
                        const Gap(20),
                        //! alooooooo

                        ToggleSwitch(
                          minWidth: 90.0,
                          cornerRadius: 20.0,
                          activeBgColors: const [
                            [kGreen],
                            [kRed]
                          ],
                          activeFgColor: Colors.white,
                          inactiveBgColor: Colors.grey,
                          inactiveFgColor: Colors.white,
                          initialLabelIndex: 1,
                          totalSwitches: 2,
                          labels: ['Oui', 'Non'],
                          radiusStyle: true,
                          onToggle: (index) {
                            print('switched to: $index');
                          },
                        ),
                      ],
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Label(text: "Montant T.T.C", main: false),
                        const Gap(20),
                        InputCustom(
                            hint: "Montant T.T.C",
                            controllerInput:
                                controller.KmPrecedentTextEditingController,
                            numeric: true),
                      ],
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Label(text: "TVA", main: false),
                        const Gap(20),
                        InputCustom(
                            hint: "TVA",
                            controllerInput:
                                controller.KmPrecedentTextEditingController,
                            numeric: true),
                      ],
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Label(text: "Montant H.T", main: false),
                        const Gap(20),
                        InputCustom(
                            hint: "Montant H.T",
                            controllerInput:
                                controller.KmPrecedentTextEditingController,
                            numeric: true),
                      ],
                    ),
                    const Gap(20),
                    const Gap(30),
                    // btn save
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                              color: KDark,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                            onPressed: () {
                              // controller.clearDataFromForm();
                              // Get.snackbar(
                              //   "Clear",
                              //   "Movement cleared ",
                              //   backgroundColor: kYellow,
                              //   colorText: Colors.white,
                              //   snackPosition: SnackPosition.TOP,
                              // );
                            },
                            child: const Text("Clear",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Gap(10),
                        Expanded(
                          child: Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                                color: KDark,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextButton(
                              // notif success
                              onPressed: () async {
                                // await controller.saveMovement();
                                // if (controller.errorMsg!.value == "") {
                                //   Get.snackbar(
                                //     "Success",
                                //     "Movement added successfully",
                                //     backgroundColor: kGreen,
                                //     colorText: Colors.white,
                                //     snackPosition: SnackPosition.TOP,
                                //   );
                                // } else {
                                //   Get.snackbar(
                                //     "Error",
                                //     controller.errorMsg!.value,
                                //     backgroundColor: kRed,
                                //     colorText:
                                //         Color.fromARGB(255, 124, 101, 101),
                                //     snackPosition: SnackPosition.TOP,
                                //   );
                                // }
                              },
                              child: const Text("Save",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ],
                    ),

                    //! if type is  output
                  ],
                )),
          )
        : Center(
            child: CircularProgressIndicator(),
          ));
  }
}

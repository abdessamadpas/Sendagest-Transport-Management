import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../constant.dart';
import 'package:sendatrack/widgets/dashboardStock/label.dart';
import 'package:sendatrack/widgets/dashboardStock/ship.dart';
import 'package:sendatrack/widgets/dashboardStock/pickerdate.dart';
import 'package:sendatrack/widgets/dashboardStock/selectInput.dart';
import 'package:sendatrack/widgets/dashboardStock/inputCustom.dart';
import 'package:get/get.dart';
import 'package:sendatrack/controllers/stock/movementController.dart';

class FormMovement extends StatefulWidget {
  final TabController tabController;

  const FormMovement({required this.tabController});

  @override
  State<FormMovement> createState() => _FormMovementState();
}

class _FormMovementState extends State<FormMovement> {
  MovementController controller = Get.put(MovementController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => !controller.isLoading.value
          ? Scaffold(
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              body: SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Label(text: "General", main: true),
                      Divider(color: Colors.black),
                      Gap(10),
                      //todo:  type of movement
                      Label(text: "Type", main: false),
                      Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Ship(text: "Input"),
                          Gap(10),
                          Ship(text: "Output")
                        ],
                      ),
                      const Gap(20),
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
                          Label(text: "Depot", main: false),
                          const Gap(20),
                          SelectInput(list: controller.listDepot, type: "depot")
                        ],
                      ),

                      const Gap(20),
                      controller.input.value
                          ? Label(text: "Input", main: true)
                          : Label(text: "Output", main: true),
                      const Divider(color: Colors.black),
                      //! if type is  input

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Label(text: "Reference", main: false),
                          const Gap(20),
                          SelectInput(
                            list: controller.listReference,
                            type: 'reference',
                          )
                        ],
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Label(text: "Designation", main: false),
                          const Gap(20),
                          InputCustom(
                              hint: "Select a designation",
                              controllerInput:
                                  controller.DesignationTextEditingController,
                              numeric: false),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Label(text: "Quantity", main: false),
                          const Gap(20),
                          InputCustom(
                              hint: "Enter a quantity",
                              controllerInput:
                                  controller.QuantityTextEditingController,
                              numeric: true),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Label(text: "Prix", main: false),
                          const Gap(20),
                          InputCustom(
                              hint: "Enter a prix",
                              controllerInput:
                                  controller.PriceTextEditingController,
                              numeric: true),
                        ],
                      ),
                      const Gap(20),
                      controller.output.value
                          ? Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Label(text: "Vehicle ID", main: false),
                                    const Gap(20),
                                    SelectInput(
                                      list: controller.listVehicle,
                                      type: "vehicle",
                                    )
                                  ],
                                ),
                                Gap(20)
                              ],
                            )
                          : Container(),

                      controller.output.value
                          ? Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Label(text: "Type de Panne", main: false),
                                  const Gap(20),
                                  SelectInput(
                                    list: controller.listTypePanne,
                                    type: "typePanne",
                                  )
                                ],
                              ),
                              const Gap(20),
                            ])
                          : Container(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Label(text: "Citerne", main: false),
                          const Gap(20),
                          SelectInput(
                            list: controller.listCiterne,
                            type: "citerne",
                          )
                        ],
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Label(text: "Observation", main: false),
                          const Gap(20),
                          InputCustom(
                              hint: "enter ur observation",
                              controllerInput:
                                  controller.ObservationTextEditingController,
                              numeric: false),
                        ],
                      ),

                      const Gap(20),
                      controller.output.value
                          ? Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Label(text: "Kilometrage", main: false),
                                  const Gap(20),
                                  InputCustom(
                                      hint: "Enter ur kilometrage ",
                                      controllerInput: controller
                                          .KilometrageTextEditingController,
                                      numeric: true),
                                ],
                              ),
                              const Gap(20),
                            ])
                          : Container(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Label(text: "TVA %", main: false),
                          const Gap(20),
                          InputCustom(
                              hint: "Enter ur TVA %",
                              controllerInput:
                                  controller.TVATextEditingController,
                              numeric: true),
                        ],
                      ),

                      const Gap(30),
                      // btn save
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: KDark,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextButton(
                                // notif success
                                onPressed: () {
                                  Get.snackbar(
                                    "Success",
                                    "Movement added successfully",
                                    backgroundColor: kGreen,
                                    colorText: Colors.white,
                                    snackPosition: SnackPosition.TOP,
                                  );
                                  controller.saveMovement();
                                },
                                child: const Text("Save",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          const Gap(10),
                          Expanded(
                            child: Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: KDark,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextButton(
                                onPressed: () {
                                  Get.snackbar(
                                    "Clear",
                                    "Movement cleared ",
                                    backgroundColor: kYellow,
                                    colorText: Colors.white,
                                    snackPosition: SnackPosition.TOP,
                                  );
                                  widget.tabController.animateTo(1);
                                },
                                child: const Text("Clear",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          )
                        ],
                      ),

                      //! if type is  output
                    ],
                  )),
            )
          : CircularProgressIndicator(),
    );
  }
}

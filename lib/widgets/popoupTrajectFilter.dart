import 'package:drop_down_list/drop_down_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sendatrack/widgets/multiSelectInput.dart';
import '../constant.dart';
import 'package:sendatrack/widgets/ship.dart';
import 'package:get/get.dart';
import 'package:sendatrack/controllers/trajects/PopupTrajectController.dart';

class DropDownListExample extends StatefulWidget {
  const DropDownListExample({
    Key? key,
  }) : super(key: key);

  @override
  _DropDownListExampleState createState() => _DropDownListExampleState();
}

class _DropDownListExampleState extends State<DropDownListExample> {
  final FilterTrajectsController controller =
      Get.put(FilterTrajectsController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        child: AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0))),
      scrollable: true,
      content: Builder(
        builder: (context) {
          return Container(
            width: width,
            child: Column(
              children: [
                // header
                Row(
                  children: [
                    const Text(
                      'Filters',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                    )
                  ],
                ),
                Gap(10),
                // status
                Wrap(
                  runAlignment: WrapAlignment.spaceBetween,
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    //TODO:  ships list
                    SelectedOne(
                      name: 'Demarer',
                      useInvoice: false,
                    ),
                    SelectedOne(
                      name: 'En cours',
                      useInvoice: false,
                    ),
                    SelectedOne(
                      name: 'Terminer',
                      useInvoice: false,
                    ),
                    SelectedOne(
                      name: 'Confirmer',
                      useInvoice: false,
                    ),
                  ],
                ),

                // unputs
                const SizedBox(
                  height: 20,
                ),
                AppTextField(
                  textEditingController: controller.clientTextEditingController,
                  // title: 'client',
                  hint: 'client',
                  isCitySelected: true,
                  cities: controller.listOfCities,
                  type: 'client',
                ),
                const SizedBox(
                  height: 10,
                ),
                AppTextField(
                  textEditingController:
                      controller.vehiculeTextEditingController,
                  // title: 'vehicle ',
                  hint: 'vehicle',
                  type: 'vehicle',

                  isCitySelected: true,
                  cities: controller.listOfVehicles,
                ),
                const SizedBox(
                  height: 10,
                ),
                AppTextField(
                  textEditingController:
                      controller.trajectTextEditingController,
                  // title: 'traject number ',
                  hint: ' traject number',
                  isCitySelected: false,
                  type: 'traject number',
                ),
                const SizedBox(
                  height: 20,
                ),
                // buttons clear and apply
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        controller.clearData();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(45, 12, 45, 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        side: const BorderSide(color: Colors.black, width: 1),
                      ),
                      child: const Text(
                        'Clear',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.applyFilter();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(45, 12, 45, 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: kDarkBlue,
                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                      ),
                      child: const Text(
                        'Filter',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    ));
  }
}

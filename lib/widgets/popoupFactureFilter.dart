import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sendatrack/widgets/multiSelectInput.dart';
import '../constant.dart';
import 'package:sendatrack/widgets/ship.dart';
import 'package:get/get.dart';
import 'package:sendatrack/controllers/invoices/popupFactureController.dart';

class PopupFactureFilter extends StatefulWidget {
  const PopupFactureFilter({super.key});

  @override
  State<PopupFactureFilter> createState() => _PopupFactureFilterState();
}

class _PopupFactureFilterState extends State<PopupFactureFilter> {
  final FilterInvoiceController controller = Get.put(FilterInvoiceController());

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
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
                      name: 'Non Regle',
                      useInvoice: true,
                    ),
                    SelectedOne(
                      name: 'Annuler',
                      useInvoice: true,
                    ),
                    SelectedOne(
                      name: 'Regle Tot',
                      useInvoice: true,
                    ),
                    SelectedOne(
                      name: 'more',
                      useInvoice: true,
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
                  hint: 'Client',
                  isCitySelected: true,
                  cities: controller.listOfClients,
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                // AppTextField(
                //   textEditingController:
                //       controller.vehiculeTextEditingController,
                //   // title: 'vehicle ',
                //   hint: 'vehicle',
                //   isCitySelected: true,
                //   cities: controller.listOfVehicles,
                // ),
                const SizedBox(
                  height: 10,
                ),
                AppTextField(
                  textEditingController:
                      controller.invoiceTextEditingController,
                  // title: 'traject number ',
                  hint: ' Facture number',
                  isCitySelected: false,
                ),
                const SizedBox(
                  height: 15,
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
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
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
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
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

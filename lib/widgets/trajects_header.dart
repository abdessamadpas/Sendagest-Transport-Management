import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sendatrack/widgets/custom_date_range_picker.dart';
import 'package:sendatrack/model/filter_facture_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:sendatrack/widgets/filter-trajects.dart';
import '../constant.dart';

class TrajectsHeader extends StatefulWidget {
  final String? headerName;
  final Function callBackForFilter;
  const TrajectsHeader(
      {required this.headerName, required this.callBackForFilter, super.key});

  @override
  State<TrajectsHeader> createState() => _TrajectsHeaderState();
}

class _TrajectsHeaderState extends State<TrajectsHeader> {
  DateTime? startDate = null;
  DateTime? endDate = null;

  TextEditingController _controllerClient = TextEditingController();
  TextEditingController _controllerFacture = TextEditingController();
  String? selectedStatus;

  FiltrageFactureModel filterSelected = FiltrageFactureModel(
      NumFacture: "",
      Societ: "",
      DateFacure: "",
      EtatFacture: "",
      startDate: null,
      endDate: null);

  void handlerChange() {
    filterSelected.EtatFacture = selectedStatus ?? "";
    filterSelected.NumFacture = _controllerFacture.text;
    filterSelected.Societ = _controllerClient.text;
    widget.callBackForFilter(filterSelected);
  }

  String castDate(startDate, endDate) {
    if (startDate == null && endDate == null) {
      return "${DateTime.now().day}/${DateTime.now().month} ";
    } else if (startDate == null) {
      return "Select Start Date";
    } else if (endDate == null) {
      return "Select End Date";
    }
    List<String> start = startDate.toString().split(" ").first.split("-");
    List<String> end = endDate.toString().split(" ").first.split("-");
    if (start[0] == end[0] && start[1] == end[1] && start[2] == end[2]) {
      return "${start[2]}/${start[1]}";
    }
    return "${start[2]}/${start[1]} - ${end[2]}/${end[1]}";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.headerName ?? "",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 5,
            ),
            const Gap(10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                foregroundColor: Colors.black54,
                shadowColor: Colors.transparent,
                elevation: 0.0,
              ).copyWith(
                elevation: ButtonStyleButton.allOrNull(0.0),
              ),
              child: const Text('Filter',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                        child: Expanded(
                            child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 118, 165, 247)
                                .withOpacity(1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      width: 300,
                      height: 390,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Text(
                            "Filters",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const Gap(10),
                          Traject_Filters(),
                          //! get data form this widget

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(137, 53, 131, 247),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: const EdgeInsets.only(
                                          left: 30,
                                          right: 30,
                                          top: 15,
                                          bottom: 15),
                                      child: const Text('Cancel',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255))))),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 54, 134, 247),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: const EdgeInsets.only(
                                          left: 30,
                                          right: 30,
                                          top: 15,
                                          bottom: 15),
                                      child: GestureDetector(
                                        onTap: () {
                                          handlerChange();
                                        },
                                        child: const Text("Apply",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255))),
                                      ))),
                            ],
                          )
                        ],
                      ),
                    )));
                  },
                );
              },
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.calendar_month_outlined,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 5,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  endDate = null;
                  startDate = null;
                });
              },
              child: Text(
                "Today",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            TextButton( 
              onPressed: () {
                showCustomDateRangePicker(
                  context,
                  dismissible: true,
                  minimumDate:
                      DateTime.now().subtract(const Duration(days: 50000)),
                  maximumDate: DateTime.now().add(const Duration(days: 50000)),
                  endDate: endDate,
                  startDate: startDate,
                  backgroundColor: Colors.white,
                  primaryColor: kDarkBlue,
                  onApplyClick: (start, end) {
                    setState(() {
                      endDate = end;
                      startDate = start;
                    });
                    debugPrint('debug: $startDate  + $endDate');
                  },
                  onCancelClick: () {
                    setState(() {
                      endDate = null;
                      startDate = null;
                    });
                  },
                );
              },
              child: Text(
                castDate(startDate, endDate),
                style: const TextStyle(
                  fontSize: 16,
                  color: kDarkBlue,
                  height: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

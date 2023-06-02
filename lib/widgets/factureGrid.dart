import 'package:flutter/material.dart';
import 'package:sendatrack/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendatrack/services/facture.dart';
import 'package:sendatrack/model/facture_model.dart';
import 'package:sendatrack/screens/factureDetail_screen.dart';

import 'package:gap/gap.dart';

class FactureGrid extends StatefulWidget {
  const FactureGrid({super.key});

  @override
  State<FactureGrid> createState() => _FactureGridState();
}

class _FactureGridState extends State<FactureGrid> {
  bool isLoading = true;
  List<Facture> invoicesList = [];

  @override
  void initState() {
    super.initState();
    // Fetch trajects data when the widget is initialized
    fetchInvoices();
  }

  Future<void> fetchInvoices() async {
    try {
      List<Facture> data = await InvoiceService.getInvoices();
      setState(() {
        isLoading = false;
        invoicesList = data;
      });
    } catch (error) {
      print('Error fetching trajects: $error');
      // Handle error state or display error message
    }
  }

  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            //! length needs to be dynamic
            itemCount: invoicesList.length > 0 ? invoicesList.length : 0,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 15 / 4.1,
                crossAxisCount: 1,
                mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FactureDetailScreen(
                                facture: invoicesList[index],
                              )));
                },
                child: Container(
                  decoration: BoxDecoration(
                    // gradient: const LinearGradient(
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    //   colors: [
                    //     kDarkBlue,
                    //     Color.fromARGB(255, 255, 255, 255),
                    //   ],
                    // ),
                    borderRadius: BorderRadius.circular(
                        16.0), // Adjust the radius as needed
                    // border: Border.all(
                    //     width: 1.0, color: Colors.grey), // Optional: Add a border
                    color: Color.fromARGB(194, 231, 249, 255),
                  ),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color:
                                              invoicesList[index].EtatFacture ==
                                                      "ANNULER"
                                                  ? kRed
                                                  : invoicesList[index]
                                                              .EtatFacture ==
                                                          "NONREGLE"
                                                      ? kOrange
                                                      : kGreen,
                                        ),
                                        width: 100.w,
                                        height: 25.h,
                                      ),
                                      const Gap(10),
                                      Text(invoicesList[index].NumFacture,
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400))
                                    ],
                                  )),
                                  const Gap(5),
                                  Expanded(
                                      child: Text(invoicesList[index].Societ,
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold))),
                                  const Gap(10),
                                  Expanded(
                                      child: Text(
                                          invoicesList[index].DateFacure,
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 170, 170, 170),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400))),
                                ],
                              )),
                        ),
                        const Gap(15),
                        Container(
                          // padding: EdgeInsets.only(top: 10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                    '${invoicesList[index].TotalHT}  ${invoicesList[index].Devises}',
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                                const Gap(10),
                                invoicesList[index].EtatFacture == 'NONREGLE'
                                    ? const Text(' 32 days',
                                        style: TextStyle(
                                            color: kRed,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold))
                                    : Container(),
                              ]),
                        ),
                      ]),
                ),
              );
            });
  }
}

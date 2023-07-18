import 'package:flutter/material.dart';
import 'package:sendatrack/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendatrack/screens/factureDetail_screen.dart';
import 'package:gap/gap.dart';
import 'package:sendatrack/widgets/shimmer_facture_card.dart';
import 'package:get/get.dart';
import 'package:sendatrack/controllers/invoices/factureController.dart';

class FactureGrid extends StatefulWidget {
  const FactureGrid({super.key});

  @override
  State<FactureGrid> createState() => _FactureGridState();
}

class _FactureGridState extends State<FactureGrid> {
  InvoiceController controller = Get.put(InvoiceController());

  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? GridView.builder(
            itemCount: 6,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 15 / 4.1,
                crossAxisCount: 1,
                mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              return Shimmer_facture_card();
            },
          )
        : (controller.invoicesList.length == 0)
            ? const Text(
                'There is no factures',
                style: TextStyle(
                    color: kDarkBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            : GridView.builder(
                //! length needs to be dynamic
                itemCount: controller.invoicesList.length > 0
                    ? controller.invoicesList.length
                    : 0,
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
                                    facture: controller.invoicesList[index],
                                  )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Color.fromARGB(194, 231, 249, 255),
                      ),
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              color: controller
                                                          .invoicesList[index]
                                                          .EtatFacture ==
                                                      "ANNULER"
                                                  ? kRed
                                                  : controller
                                                              .invoicesList[
                                                                  index]
                                                              .EtatFacture ==
                                                          "NONREGLE"
                                                      ? kOrange
                                                      : kGreen,
                                            ),
                                            width: 100.w,
                                            height: 25.h,
                                          ),
                                          const Gap(10),
                                          Text(
                                              controller.invoicesList[index]
                                                  .NumFacture,
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w400))
                                        ],
                                      )),
                                      const Gap(5),
                                      Expanded(
                                          child: Text(
                                              controller
                                                  .invoicesList[index].Societ,
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      const Gap(10),
                                      Expanded(
                                          child: Text(
                                              controller.invoicesList[index]
                                                  .DateFacure,
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 170, 170, 170),
                                                  fontSize: 15,
                                                  fontWeight:
                                                      FontWeight.w400))),
                                    ],
                                  )),
                            ),
                            const Gap(15),
                            Container(
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                        '${controller.invoicesList[index].TotalHT}  ${controller.invoicesList[index].Devises}',
                                        style: const TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                    const Gap(10),
                                    controller.invoicesList[index]
                                                .EtatFacture ==
                                            'NONREGLE'
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
                }));
  }
}

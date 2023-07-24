import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sendatrack/constant.dart';
import 'package:sendatrack/widgets/shimmer_facture_card.dart';
import 'package:get/get.dart';

class StockCard extends StatefulWidget {
  const StockCard({super.key});

  @override
  State<StockCard> createState() => _StockCardState();
}

class _StockCardState extends State<StockCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1.0, color: Color.fromARGB(255, 224, 224, 224))),
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: const [
                        Icon(
                          Icons.store,
                          color: kDarkBlue,
                        ),
                        Gap(5),
                        Text('Store',
                            style: TextStyle(
                                color: kDarkBlue,
                                fontWeight: FontWeight.w800,
                                fontSize: 16))
                      ],
                    ),
                  ),
                  const Text("Depot casablanca",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 15))
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Designation',
                          style: TextStyle(
                              color: Color.fromARGB(255, 122, 122, 122),
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                      Text("RX002",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500,
                              fontSize: 15))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: kGrey,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Reference',
                          style: TextStyle(
                              color: Color.fromARGB(255, 122, 122, 122),
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                      Text("R2",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500,
                              fontSize: 15))
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Quantity',
                          style: TextStyle(
                              color: Color.fromARGB(255, 122, 122, 122),
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                      Text("-20 units",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500,
                              fontSize: 15))
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}

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
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1.0, color: Color.fromARGB(255, 138, 134, 134))),
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(5),
              //   color: Colors.white,
              // ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.store,
                          color: kGrayIcon,
                        ),
                        Gap(5),
                        Text('Store',
                            style: TextStyle(
                                color: kGrayIcon,
                                fontWeight: FontWeight.w800,
                                fontSize: 16))
                      ],
                    ),
                  ),
                  Text("Depot casablanca",
                      style: TextStyle(color: kGrayIcon, fontSize: 15))
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
                    children: [
                      Text('Designation',
                          style: TextStyle(
                              color: Color.fromARGB(255, 122, 122, 122),
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                      Text("RX002",
                          style: TextStyle(
                              color: kGrayIcon,
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
                    children: [
                      Text('Reference',
                          style: TextStyle(
                              color: Color.fromARGB(255, 122, 122, 122),
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                      Text("R2",
                          style: TextStyle(
                              color: kGrayIcon,
                              fontWeight: FontWeight.w500,
                              fontSize: 15))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Quantity',
                          style: TextStyle(
                              color: Color.fromARGB(255, 122, 122, 122),
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                      Text("-20 units",
                          style: TextStyle(
                              color: kGrayIcon,
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

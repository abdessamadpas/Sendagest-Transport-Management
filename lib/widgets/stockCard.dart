import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sendatrack/constant.dart';
import 'package:get/get.dart';
import '../model/stock.dart';
import 'package:sendatrack/controllers/stock/stockController.dart';

class StockCard extends StatefulWidget {
  final Stock card;

  const StockCard({super.key, required this.card});

  @override
  State<StockCard> createState() => _StockCardState();
}

class _StockCardState extends State<StockCard> {
  StockController stockController = Get.put(StockController());

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
                      children: [
                        Icon(
                          stockController.product.value
                              ? Icons.production_quantity_limits_rounded
                              : (stockController.store.value
                                  ? Icons.store_mall_directory_rounded
                                  : Icons.all_inbox_rounded),
                          color: TestColor,
                        ),
                        const Gap(5),
                        Text(
                            stockController.product.value
                                ? ' Product'
                                : (stockController.store.value
                                    ? 'Store'
                                    : 'All'),
                            style: TextStyle(
                                color: TestColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 16))
                      ],
                    ),
                  ),
                  Text(widget.card.id_Store?.toString() ?? '',
                      style: TextStyle(
                          color: KDark,
                          fontWeight: FontWeight.w600,
                          fontSize: 15))
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                widget.card.Designation != null
                    ? Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Designation',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 122, 122, 122),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14)),
                            Text(widget.card.Designation ?? '',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15))
                          ],
                        ))
                    : Container(),
                widget.card.Reference != null
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: kGrey,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Reference',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 122, 122, 122),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14)),
                            Text(widget.card.Reference ?? '',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15))
                          ],
                        ),
                      )
                    : Container(),
                widget.card.Qte != null
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Quantity',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 122, 122, 122),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14)),
                            Text('${widget.card.Qte} units',
                                style: const TextStyle(
                                    color: kGreen,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15))
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          )
        ]));
  }
}

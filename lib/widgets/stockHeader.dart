import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sendatrack/constant.dart';
import 'package:sendatrack/controllers/stock/stockController.dart';
import 'package:get/get.dart';

class StockHeader extends StatefulWidget {
  const StockHeader({super.key});

  @override
  State<StockHeader> createState() => _StockHeaderState();
}

class _StockHeaderState extends State<StockHeader> {
  StockController controller = Get.put(StockController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              margin: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                onChanged: (value) => controller.filterSearchResults(value),
                autofocus: false,
                cursorColor: Color.fromARGB(255, 73, 73, 73),
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: TestColor, size: 20),
                  fillColor: Colors.white,
                  focusedBorder: UnderlineInputBorder(
                    // borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255), width: 0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    // borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255), width: 0),
                  ),
                ),
              ),
            ),
            const Gap(10),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            controller.changeStateShip('store');
                          },
                          child: Container(
                            // color: Colors.black38,
                            alignment: Alignment.center,
                            height: 40,
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            decoration: BoxDecoration(
                              color: controller.store.value
                                  ? TestColor
                                  : Colors.white,
                              border: Border.all(
                                  color: controller.store.value
                                      ? Colors.white
                                      : TestColor,
                                  width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Store',
                              style: TextStyle(
                                  color: controller.store.value
                                      ? Colors.white
                                      : TestColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15),
                            ),
                          ))),
                  const Gap(15),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            controller.changeStateShip('product');
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            decoration: BoxDecoration(
                              color: controller.product.value
                                  ? TestColor
                                  : Colors.white,
                              border: Border.all(
                                  color: controller.product.value
                                      ? Colors.white
                                      : TestColor,
                                  width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Product',
                              style: TextStyle(
                                  color: controller.product.value
                                      ? Colors.white
                                      : TestColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15),
                            ),
                          ))),
                ]),
          ],
        )));
  }
}

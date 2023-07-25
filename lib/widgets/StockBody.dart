import 'package:flutter/material.dart';
import 'package:sendatrack/constant.dart';
import 'package:sendatrack/widgets/stockCard.dart';
import 'package:get/get.dart';
import 'package:sendatrack/controllers/stock/stockController.dart';

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];

class StockBody extends StatefulWidget {
  const StockBody({super.key});

  @override
  State<StockBody> createState() => _StockBodyState();
}

class _StockBodyState extends State<StockBody> {
  StockController stockController = Get.put(StockController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => stockController.isLoading.value
        ? const Center(child: CircularProgressIndicator())
        : (stockController.stockListFiltered.length == 0)
            ? const Text(
                'There is no stock',
                style: TextStyle(
                    color: kDarkBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            : Container(
                color: kGrey,
                // height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  itemCount: stockController.stockListFiltered.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: stockController.store.value
                          ? 9 / 3.1
                          : (stockController.product.value ? 6 / 3.1 : 6 / 3.1),
                      crossAxisCount: 1,
                      mainAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    return StockCard(
                        card: stockController.stockListFiltered[index]);
                  },
                )));
  }
}

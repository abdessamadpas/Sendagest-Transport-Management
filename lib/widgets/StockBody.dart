import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sendatrack/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendatrack/widgets/stockCard.dart';

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];

class StockBody extends StatefulWidget {
  const StockBody({super.key});

  @override
  State<StockBody> createState() => _StockBodyState();
}

class _StockBodyState extends State<StockBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: kGrey,
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
          itemCount: 6,
          // physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 4 / 2.1,
              crossAxisCount: 1,
              mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            return StockCard();
          },
        ));
  }
}

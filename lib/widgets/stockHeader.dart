import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sendatrack/constant.dart';

class StockHeader extends StatefulWidget {
  const StockHeader({super.key});

  @override
  State<StockHeader> createState() => _StockHeaderState();
}

class _StockHeaderState extends State<StockHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
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
              child: const TextField(
                autofocus: false,
                cursorColor: Color.fromARGB(255, 73, 73, 73),
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
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
            Gap(10),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Container(
                    // color: Colors.black38,
                    alignment: Alignment.center,
                    height: 40,
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 44, 42, 42),
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Store',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w900,
                          fontSize: 15),
                    ),
                  )),
                  Gap(15),
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Color.fromARGB(255, 201, 199, 199), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Product',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 15),
                    ),
                  )),
                ]),
          ],
        ));
  }
}

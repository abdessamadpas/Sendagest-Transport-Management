import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sendatrack/constant.dart';

class CarsHeader extends StatefulWidget {
  const CarsHeader({super.key});

  @override
  State<CarsHeader> createState() => _CarsHeaderState();
}

class _CarsHeaderState extends State<CarsHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: kLightBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(8),
                child: const Text("Drivers",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const Gap(20),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: kLightBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.filter_list_rounded),
              ),
            ],
          ),
        ),
        Container(
            child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: kLightBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.rotate_left_rounded,
                color: Colors.grey,
                size: 20,
              ),
            ),
            const Gap(20),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: kLightBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text("Cars",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            )
          ],
        )),
      ],
    );
  }
}

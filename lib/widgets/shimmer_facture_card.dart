import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:sendatrack/constant.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class Shimmer_facture_card extends StatelessWidget {
  const Shimmer_facture_card({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      height: 100.0,
      child: Shimmer.fromColors(
        baseColor: kDarkBlue.withOpacity(0.1),
        highlightColor: Colors.grey[200]!,
        child: Container(
          width: 200.0,
          height: 190.0,
          decoration: BoxDecoration(
            color: Color.fromARGB(45, 122, 111, 111),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      BoxCustom(
                        height: 12,
                        width: 45,
                      ),
                      Gap(20),
                      BoxCustom(
                        height: 18,
                        width: 85,
                      ),
                    ],
                  ),
                  const BoxCustom(
                    height: 18,
                    width: 85,
                  ),
                ],
              ),
              const Gap(10),
              Row(
                children: const [
                  BoxCustom(
                    height: 18,
                    width: 90,
                  ),
                ],
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  BoxCustom(
                    height: 18,
                    width: 110,
                  ),
                  BoxCustom(
                    height: 17,
                    width: 110,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BoxCustom extends StatelessWidget {
  const BoxCustom({super.key, this.width, this.height});
  final double? width, height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

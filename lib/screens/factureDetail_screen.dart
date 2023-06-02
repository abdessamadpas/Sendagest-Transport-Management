import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:sendatrack/model/facture_model.dart';
import 'package:gap/gap.dart';
import 'package:sendatrack/widgets/line_dash.dart';
import 'package:sendatrack/widgets/verticalDashedLine.dart';
import 'package:sendatrack/constant.dart';

class FactureDetailScreen extends StatefulWidget {
  final Facture? facture;
  const FactureDetailScreen({this.facture, super.key});

  @override
  State<FactureDetailScreen> createState() => _FactureDetailScreenState();
}

class _FactureDetailScreenState extends State<FactureDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          iconSize: 32,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
            color: Colors.black,
            iconSize: 32,
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Center(
              child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 24),
        child: Column(children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(80, 15, 87, 255),
                        offset: Offset(0, 2),
                        blurRadius: 5.0)
                  ]),
              height: 200.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        child: Text("Invoice number",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                      ),
                      Gap(10),
                      Text("INV-0001",
                          style: TextStyle(
                              color: Color(0xFF3D1D5C),
                              fontSize: 25,
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                          child: Text("Total amount",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400))),
                      const Gap(10),
                      Text(
                        widget.facture!.TotalTTCDV.toString() + " MAD",
                        style: const TextStyle(
                            color: Color(0xFF3D1D5C),
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              )),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.receipt_long, color: Color(0xFF3D1D5C)),
                  Gap(10),
                  Text("Invoice details",
                      style: TextStyle(
                          color: Color(0xFF3D1D5C),
                          fontSize: 22,
                          fontWeight: FontWeight.w400))
                ],
              ),
              Text("12 August, 2021",
                  style: TextStyle(
                      color: Color(0xFF665D6F),
                      fontSize: 15,
                      fontWeight: FontWeight.w400))
            ],
          ),
          const Gap(25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Num facture",
                    style: TextStyle(
                      color: Color(0xFF665D6F),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Trajan Pro",
                    ),
                  ),
                  const Gap(10),
                  Text(
                    widget.facture!.NumFacture,
                    style: const TextStyle(
                        color: Color(0xFF3D1D5C),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                height: 100.h,
                child: CustomPaint(
                  painter: DashedLinePainter(
                    color: Color.fromARGB(255, 173, 173, 173),
                    dashWidth: 3.0,
                    dashSpace: 3.0,
                  ),
                ),
              ),
              Column(
                children: [
                  const Text(
                    "invoice status",
                    style: TextStyle(
                      color: Color(0xFF665D6F),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Trajan Pro",
                    ),
                  ),
                  const Gap(10),
                  Text(
                    widget.facture!.EtatFacture,
                    style: TextStyle(
                        color: widget.facture!.EtatFacture == "ANNULER"
                            ? kRed
                            : widget.facture!.EtatFacture == "NONREGLE"
                                ? kOrange
                                : kGreen,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )
                ],
              )
            ],
          ),
          const Gap(10),
          const MySeparator(
            color: Colors.grey,
            height: 1,
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Client",
                    style: TextStyle(
                      color: Color(0xFF665D6F),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Trajan Pro",
                    ),
                  ),
                  Gap(10),
                  Text(widget.facture!.Societ,
                      style: const TextStyle(
                          color: Color(0xFF3D1D5C),
                          fontSize: 18,
                          fontWeight: FontWeight.w500))
                ],
              ),
            ],
          ),
          const Gap(10),
          const MySeparator(
            color: Colors.grey,
            height: 1,
          ),
          const Gap(20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.money_off_csred_rounded, color: Color(0xFF3D1D5C)),
                  Gap(10),
                  Text("Subtotal",
                      style: TextStyle(
                          color: Color(0xFF3D1D5C),
                          fontSize: 22,
                          fontWeight: FontWeight.w400))
                ],
              ),
              const Gap(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total HT",
                    style: TextStyle(
                      color: Color(0xFF665D6F),
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Trajan Pro",
                    ),
                  ),
                  Text(
                    "${widget.facture!.TotalHT} MAD",
                    style: const TextStyle(
                        color: Color(0xFF3D1D5C),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total TVA",
                    style: TextStyle(
                      color: Color(0xFF665D6F),
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Trajan Pro",
                    ),
                  ),
                  Text("${widget.facture!.TotalTTC} MAD",
                      style: const TextStyle(
                          color: Color(0xFF3D1D5C),
                          fontSize: 20,
                          fontWeight: FontWeight.w500))
                ],
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total TTC",
                    style: TextStyle(
                      color: Color(0xFF665D6F),
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Trajan Pro",
                    ),
                  ),
                  Text("${widget.facture!.TotalTTC} MAD",
                      style: const TextStyle(
                          color: Color(0xFF3D1D5C),
                          fontSize: 20,
                          fontWeight: FontWeight.w500))
                ],
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Déjà payer",
                    style: TextStyle(
                      color: Color(0xFF665D6F),
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Trajan Pro",
                    ),
                  ),
                  Text("${widget.facture!.TotalTTC} MAD",
                      style: const TextStyle(
                          color: Color(0xFF3D1D5C),
                          fontSize: 20,
                          fontWeight: FontWeight.w500))
                ],
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Rest a payer",
                    style: TextStyle(
                      color: Color(0xFF665D6F),
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Trajan Pro",
                    ),
                  ),
                  Text(
                    "${widget.facture!.restepay} MAD",
                    style: const TextStyle(
                        color: Color(0xFF3D1D5C),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Gap(20),
              widget.facture!.Devises == 'EUR'
                  ? Container(
                      child: Column(
                        children: [
                          const MySeparator(
                            color: Colors.grey,
                            height: 1,
                          ),
                          const Gap(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Devise",
                                style: TextStyle(
                                  color: Color(0xFF665D6F),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "Trajan Pro",
                                ),
                              ),
                              const Gap(20),
                              Text(
                                "${widget.facture!.Devises} ",
                                style: const TextStyle(
                                    color: Color(0xFF3D1D5C),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Gap(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Taux Devise",
                                style: TextStyle(
                                  color: Color(0xFF665D6F),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "Trajan Pro",
                                ),
                              ),
                              const Gap(20),
                              Text(
                                "${widget.facture!.TauxDevise} MAD",
                                style: const TextStyle(
                                    color: Color(0xFF3D1D5C),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Gap(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total HTDV",
                                style: TextStyle(
                                  color: Color(0xFF665D6F),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "Trajan Pro",
                                ),
                              ),
                              const Gap(20),
                              Text(
                                "${widget.facture!.TotalHTDV} ${widget.facture!.Devises}",
                                style: const TextStyle(
                                    color: Color(0xFF3D1D5C),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Gap(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total TTCDV",
                                style: TextStyle(
                                  color: Color(0xFF665D6F),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "Trajan Pro",
                                ),
                              ),
                              const Gap(20),
                              Text(
                                "${widget.facture!.TotalTTCDV}  ${widget.facture!.Devises}",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 43, 110, 255),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
          const Gap(10),
          const MySeparator(
            color: Colors.grey,
            height: 1,
          ),
        ]),
      ))),
    );
  }
}

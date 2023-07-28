import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../constant.dart';
import 'package:sendatrack/widgets/dashboardStock/label.dart';
import 'package:sendatrack/widgets/dashboardStock/ship.dart';
import 'package:sendatrack/widgets/dashboardStock/pickerdate.dart';
import 'package:sendatrack/widgets/dashboardStock/selectInput.dart';
import 'package:sendatrack/widgets/dashboardStock/inputCustom.dart';

class FormMovement extends StatefulWidget {
  const FormMovement({super.key});

  @override
  State<FormMovement> createState() => _FormMovementState();
}

class _FormMovementState extends State<FormMovement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Label(text: "General", main: true),
              Divider(color: Colors.black),
              Gap(10),
              //todo:  type of movement
              Label(text: "type", main: false),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Ship(text: "input"), Gap(10), Ship(text: "output")],
              ),
              const Gap(20),
              //todo:  date of movement
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Label(text: "date", main: false),
                  const Gap(20),
                  Pickerdate()
                ],
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Label(text: "depot", main: false),
                  const Gap(20),
                  SelectInput()
                ],
              ),

              const Gap(20),
              Label(text: "Output", main: true),
              const Divider(color: Colors.black),
              //! if type is  input

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Label(text: "Reference", main: false),
                  const Gap(20),
                  SelectInput()
                ],
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Label(text: "Designation", main: false),
                  const Gap(20),
                  InputCustom(hint: "select a designation", numeric: false),
                ],
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Label(text: "Quantity", main: false),
                  const Gap(20),
                  InputCustom(hint: "Enter a quantity", numeric: true),
                ],
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Label(text: "Prix", main: false),
                  const Gap(20),
                  InputCustom(hint: "Enter a prix", numeric: true),
                ],
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Label(text: "Citerne", main: false),
                  const Gap(20),
                  SelectInput()
                ],
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Label(text: "Observation", main: false),
                  const Gap(20),
                  InputCustom(hint: "select a citerne", numeric: false),
                ],
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Label(text: "TVA %", main: false),
                  const Gap(20),
                  InputCustom(hint: "Enter a TVA %", numeric: true),
                ],
              ),

              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Label(text: "Vehicle ID", main: false),
                  const Gap(20),
                  SelectInput()
                ],
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Label(text: "Type de Panne", main: false),
                  const Gap(20),
                  SelectInput()
                ],
              ),
              const Gap(20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Label(text: "kilometrage", main: false),
                  const Gap(20),
                  InputCustom(hint: "Enter a kilometrage ", numeric: true),
                ],
              ),
              const Gap(30),
              // btn save
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          color: KDark,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {},
                        child: Text("Save",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          color: KDark,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {},
                        child: Text("Cancel",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  )
                ],
              ),

              //! if type is  output
            ],
          )),
    );
  }
}

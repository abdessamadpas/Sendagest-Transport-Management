import 'package:flutter/material.dart';

class Ship extends StatefulWidget {
  String text;
  Ship({super.key, required this.text});

  @override
  State<Ship> createState() => _ShipState();
}

class _ShipState extends State<Ship> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 209, 237, 255),
            ),
            child: Center(
              child: Text(
                widget.text,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 110, 211),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )));
  }
}

import 'package:flutter/material.dart';

class CarsGrid extends StatefulWidget {
  const CarsGrid({super.key});

  @override
  State<CarsGrid> createState() => _CarsGridState();
}

class _CarsGridState extends State<CarsGrid> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Table(
          border: TableBorder.all(color: Colors.black),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: const [
            TableRow(
              children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('data 1'),
                    )),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('data 2'),
                    )),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('data 3'),
                    )),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('data 4'),
                    )),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('data 5'),
                    )),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('data 6'),
                    )),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('data 7'),
                    )),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('data 8'),
                    )),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('data 9'),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

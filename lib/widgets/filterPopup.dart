import 'package:flutter/material.dart';

class FilterPopup extends StatefulWidget {
  const FilterPopup({Key? key}) : super(key: key);

  @override
  State<FilterPopup> createState() => _FilterPopupState();
}

class _FilterPopupState extends State<FilterPopup> {
  void showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 118, 165, 247).withOpacity(1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            width: 300,
            height: 390,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  "Filters",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                // Add your filter widgets here
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(137, 53, 131, 247),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(15),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 54, 134, 247),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(15),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Apply",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      showFilterDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

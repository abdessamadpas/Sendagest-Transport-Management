import 'package:flutter/material.dart';
import 'package:sendatrack/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendatrack/services/facture.dart';
import 'package:sendatrack/model/facture_model.dart';

class FactureGrid extends StatefulWidget {
  const FactureGrid({super.key});

  @override
  State<FactureGrid> createState() => _FactureGridState();
}

class _FactureGridState extends State<FactureGrid> {
  bool isLoading = false;
  List<Facture> invoicesList = [];

  @override
  void initState() {
    super.initState();
    // Fetch trajects data when the widget is initialized
    fetchInvoices();
  }

  Future<void> fetchInvoices() async {
    try {
      List<Facture> data = await InvoiceService.getInvoices();
      // print(data);
      setState(() {
        isLoading = false;

        invoicesList = data;
      });
    } catch (error) {
      print('Error fetching trajects: $error');
      // Handle error state or display error message
    }
  }

  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            //! length needs to be dynamic
            itemCount: invoicesList.length > 0 ? invoicesList.length : 2,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 19 / 4.1,
                crossAxisCount: 1,
                mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    // gradient: const LinearGradient(
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    //   colors: [
                    //     kDarkBlue,
                    //     Color.fromARGB(255, 255, 255, 255),
                    //   ],
                    // ),
                    borderRadius: BorderRadius.circular(
                        16.0), // Adjust the radius as needed
                    // border: Border.all(
                    //     width: 1.0, color: Colors.grey), // Optional: Add a border
                    color: Color.fromARGB(57, 155, 222, 255),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 170.w,
                          height: 170.h,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              // etat de la facture (positif ou negatif)
                              child: Image.asset("images/invoiceNegatif.png")),
                        ),
                        Text("data")
                      ]),
                ),
              );
            });
  }
}

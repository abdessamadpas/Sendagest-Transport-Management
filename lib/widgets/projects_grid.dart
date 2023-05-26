import 'package:flutter/material.dart';
import 'package:sendatrack/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendatrack/model/trajects_model.dart';
import 'package:sendatrack/widgets/line_dash.dart';
import 'package:sendatrack/constant.dart';
import 'package:sendatrack/services/trajects.dart';
import 'package:sendatrack/screens/detailsTraject_screen.dart';

class ProjectsGrid extends StatefulWidget {
  const ProjectsGrid({super.key});
  @override
  State<ProjectsGrid> createState() => _ProjectsGridState();
}

class _ProjectsGridState extends State<ProjectsGrid> {
  List<Traject> trajectsList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Fetch trajects data when the widget is initialized
    fetchTrajects();
  }

  Future<void> fetchTrajects() async {
    try {
      List<Traject> data = await TrajectsService.getTrajects();
      setState(() {
        isLoading = false;

        trajectsList = data;
      });
    } catch (error) {
      print('Error fetching trajects: $error');
      // Handle error state or display error message
    }
  }

  String getFirstAndLastCity(String libelleTrajet) {
    List<String> cities =
        libelleTrajet.split(">").map((city) => city.trim()).toList();
    if (cities.isNotEmpty) {
      String firstCity = cities.first;
      String lastCity = cities.last;
      return "$firstCity >$lastCity";
    }
    return " error in casting cities";
  }

  String getFirstLetter(String input) => input.substring(0, 1).toUpperCase();

  String truncateString(String input, int maxLength) {
    if (input.length <= maxLength) {
      return input;
    } else {
      return input.substring(0, maxLength - 3) + "...";
    }
  }

  Color getColor(String letter) {
    Color selectedColor = Colors.black;
    if (letter == 'D') {
      selectedColor = kGreen;
    } else if (letter == 'E') {
      selectedColor = kOrange;
    } else if (letter == 'T') {
      selectedColor = kDarkBlue;
    }
    return selectedColor;
  }

  String getTime(String date) {
    List<String> justTime = date.split(".");
    if (justTime.isNotEmpty) {
      String time = justTime.first;
      return time;
    }
    return " error in casting time";
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // Declare a list of Item objects

    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            //! length needs to be dynamic
            itemCount: trajectsList.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 9 / 4.1,
                crossAxisCount: 1,
                mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailsTraject(traject: trajectsList[index])));
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        kDarkBlue,
                        Color.fromARGB(255, 255, 255, 255),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(
                        16.0), // Adjust the radius as needed
                    // border: Border.all(
                    //     width: 1.0, color: Colors.grey), // Optional: Add a border
                    color: Color.fromARGB(57, 155, 222, 255),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 6,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 6,
                                child: Container(
                                  width: width * 0.66,
                                  // height: 200.h,
                                  padding: const EdgeInsets.all(5),
                                  //color: Color.fromARGB(255, 247, 122, 76),
                                  child: FractionallySizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          trajectsList[index].Statut,
                                          style: TextStyle(
                                              fontSize: 47.sp,
                                              color: TestColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          truncateString(
                                              getFirstAndLastCity(
                                                  trajectsList[index]
                                                      .libelletrajet),
                                              20),
                                          style: TextStyle(
                                              fontSize: 55.sp,
                                              color: DarkBlueTest,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          truncateString(
                                              trajectsList[index].Client, 20),
                                          style: TextStyle(
                                              fontSize: 47.sp,
                                              color: TestColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Row(children: [
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                    height: 150.h,
                                    width: 95.w,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          getFirstLetter(
                                              trajectsList[index].Statut),
                                          style: TextStyle(
                                            color: getColor(getFirstLetter(
                                                trajectsList[index].Statut)),
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            //fontWeight: FontWeight.bold
                                            fontFamily: 'Montserrat',
                                          ),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  width: 25.w,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                  height: 150.h,
                                  width: 95.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.gps_fixed_rounded,
                                        color: kDarkBlue,
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ])
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10.h,
                      ),
                      //! MySeparator(color: Colors.grey),
                      const MySeparator(
                          color: Color.fromARGB(143, 163, 169, 250)),
                      Expanded(
                          flex: 4,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      trajectsList[index].Remorque,
                                      style: TextStyle(color: TestColor),
                                    ),
                                    Text(
                                      trajectsList[index].Vehicule,
                                      style: TextStyle(color: TestColor),
                                    ),
                                    Text(
                                      trajectsList[index].Chauffeur,
                                      style: TextStyle(color: TestColor),
                                    ),
                                  ],
                                )),
                                Container(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.av_timer_outlined,
                                            color: kDarkBlue,
                                            size: 20,
                                          ),
                                          Text(
                                            getTime(trajectsList[index]
                                                .heureDepart),
                                            style: TextStyle(color: TestColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.date_range_rounded,
                                            color: kDarkBlue,
                                            size: 20,
                                          ),
                                          Text(
                                            trajectsList[index].Datedepart,
                                            style: TextStyle(color: TestColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              );
            });
  }

  void fetchData() {
    TrajectsService.getTrajects().then((data) {
      // Handle the API response
      print(data);
      setState(() {
        trajectsList = data; // Update the list of items with the parsed data
      });
    }).catchError((error) {
      // Handle errors
    });
  }
}

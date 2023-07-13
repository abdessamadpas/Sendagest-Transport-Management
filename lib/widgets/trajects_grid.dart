import 'package:flutter/material.dart';
import 'package:sendatrack/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendatrack/model/trajects_model.dart';
import 'package:sendatrack/widgets/line_dash.dart';
import 'package:sendatrack/constant.dart';
import 'package:sendatrack/services/trajects.dart';
import 'package:sendatrack/screens/detailsTraject_screen.dart';
import '../controllers/TrajectController.dart';
import 'package:get/get.dart';

class ProjectsGrid extends StatefulWidget {
  const ProjectsGrid({super.key});
  @override
  State<ProjectsGrid> createState() => _ProjectsGridState();
}

class _ProjectsGridState extends State<ProjectsGrid> {
  final TrajectsController controller = Get.put(TrajectsController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // Declare a list of Item objects

    return Obx(() => controller.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : (controller.trajectsList.length == 0
            ? Text(
                'There is no trajects',
                style: TextStyle(
                    color: kDarkBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            : GridView.builder(
                itemCount: controller.trajectsList.length,
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
                              builder: (context) => DetailsTraject(
                                  traject: controller.trajectsList[index])));
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                              controller.trajectsList[index]
                                                  .Num_Trajet,
                                              style: TextStyle(
                                                  fontSize: 47.sp,
                                                  color: TestColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              controller.truncateString(
                                                  controller
                                                      .getFirstAndLastCity(
                                                          controller
                                                              .trajectsList[
                                                                  index]
                                                              .libelletrajet),
                                                  20),
                                              style: TextStyle(
                                                  fontSize: 55.sp,
                                                  color: DarkBlueTest,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              controller.truncateString(
                                                  controller.trajectsList[index]
                                                      .Client,
                                                  20),
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                        height: 150.h,
                                        width: 95.w,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              controller.getFirstLetter(
                                                  controller.trajectsList[index]
                                                      .Statut),
                                              style: TextStyle(
                                                color: controller.getColor(
                                                    controller.getFirstLetter(
                                                        controller
                                                            .trajectsList[index]
                                                            .Statut)),
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
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                      height: 150.h,
                                      width: 95.w,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          controller
                                              .trajectsList[index].Remorque,
                                          style: TextStyle(color: TestColor),
                                        ),
                                        Text(
                                          controller
                                              .trajectsList[index].Vehicule,
                                          style: TextStyle(color: TestColor),
                                        ),
                                        Text(
                                          controller
                                              .trajectsList[index].Chauffeur,
                                          style: TextStyle(color: TestColor),
                                        ),
                                      ],
                                    )),
                                    Container(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                controller.getTime(controller
                                                    .trajectsList[index]
                                                    .heureDepart),
                                                style:
                                                    TextStyle(color: TestColor),
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
                                                controller.trajectsList[index]
                                                    .Datedepart,
                                                style:
                                                    TextStyle(color: TestColor),
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
                })));
  }
}

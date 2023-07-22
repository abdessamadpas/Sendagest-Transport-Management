import 'package:sendatrack/screens/facture_screen.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import '../constant.dart';
import '../screens/components/side_menu.dart';
import 'trajects_screen.dart';
import 'package:sendatrack/screens/components/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:sendatrack/screens/cars.dart';
import '../controllers/home_controller.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Colors.grey, size: 28),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, right: 16, bottom: 5),
                child: const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1500522144261-ea64433bbe27?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTh8fHdvbWVufGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
                ),
              )
            ],
            bottom: TabBar(
                indicatorColor: kDarkBlue,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3,
                // indicator: CircleTabIndicator(color: kDarkBlue, radius: 3),
                indicator: DotTabIndicator(color: Colors.blue),
                tabs: [
                  Tab(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kDarkBlue.withOpacity(.1),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(-20, -20),
                            blurRadius: 60,
                            color: Color.fromRGBO(255, 255, 255, 0.675),
                            inset: true,
                          ),
                          BoxShadow(
                            offset: Offset(8, 2),
                            color: kDarkBlue,
                            spreadRadius: -13.0,
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      child: const Icon(
                        FontAwesomeIcons.house,
                        color: kDarkBlue,
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kDarkBlue.withOpacity(.1),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(-20, -20),
                            blurRadius: 60,
                            color: Color.fromRGBO(255, 255, 255, 0.675),
                            inset: true,
                          ),
                          BoxShadow(
                            offset: Offset(8, 2),
                            color: kDarkBlue,
                            spreadRadius: -13.0,
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      child: const Icon(
                        FontAwesomeIcons.mapMarkedAlt,
                        color: kDarkBlue,
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kDarkBlue.withOpacity(.1),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(-20, -20),
                            blurRadius: 60,
                            color: Color.fromRGBO(255, 255, 255, 0.675),
                            inset: true,
                          ),
                          BoxShadow(
                            offset: Offset(8, 2),
                            color: kDarkBlue,
                            spreadRadius: -13.0,
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      child: const Icon(
                        FontAwesomeIcons.car,
                        color: kDarkBlue,
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kDarkBlue.withOpacity(.1),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(-20, -20),
                            blurRadius: 60,
                            color: Color.fromRGBO(255, 255, 255, 0.675),
                            inset: true,
                          ),
                          BoxShadow(
                            offset: Offset(8, 2),
                            color: kDarkBlue,
                            spreadRadius: -13.0,
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.assignment,
                        color: kDarkBlue,
                      ),
                    ),
                  ),
                ]),
          ),
          drawer: SideMenu(),
          body: const TabBarView(
            children: [Home(), Trajects(), Cars(), Facture()],
          ),
        ));
  }
}

class DotTabIndicator extends Decoration {
  final Color color;

  DotTabIndicator({required this.color});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _DotTabIndicatorPainter(color: color);
  }
}

class _DotTabIndicatorPainter extends BoxPainter {
  final Paint _paint;

  _DotTabIndicatorPainter({required Color color})
      : _paint = Paint()
          ..color = color
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final rect = offset & configuration.size!;
    final center = Offset(rect.center.dx, rect.bottom - 6);

    canvas.drawCircle(center, 4, _paint);
  }
}

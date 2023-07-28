import 'package:flutter/material.dart';
import 'package:sendatrack/controllers/login/loginContoller.dart';
import 'package:ternav_icons/ternav_icons.dart';
import 'package:get/get.dart';
import '../../constant.dart';

class SideMenu extends StatelessWidget {
  LoginController controller = Get.put(LoginController());
  SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.5,
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
                child: Image.asset(
              "images/senda-logo.png",
            )),
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.home_2,
            title: "Overview",
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.send_up,
            title: "Trajets",
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.census,
            title: "Facturations",
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.received,
            title: "Achat",
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.menu,
            title: "Stock",
            onTap: () {
              Get.toNamed("/dashboardStock");
            },
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.settings,
            title: "Maintenance",
            onTap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            "images/help.png",
            height: 150,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
                color: kLightBlue, borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Sendtrack Support",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("contact us",
                        style: TextStyle(color: kDarkBlue)),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: kDarkBlue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.keyboard_double_arrow_right_rounded,
                          color: kDarkBlue,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.login,
            title: "Logout",
            onTap: () {
              controller.logout();
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 0,
      leading: Icon(
        icon,
        color: Colors.grey,
        size: 18,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}

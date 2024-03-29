import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendatrack/constant.dart';
import 'package:sendatrack/controllers/login/loginContoller.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool status = true;
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(1080, 1920),
    );
    return Scaffold(
        backgroundColor: Color(0xFFF1F3F6),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(120)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil().setHeight(100),
                    ),
                    const Text(
                      "Login",
                      style: TextStyle(
                          color: Color(0xff369FFF),
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(170),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Image.asset(
                              'images/senda-logo.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    Stack(
                      children: <Widget>[
                        TextField(
                          controller:
                              loginController.accountTextEditingController,
                          style: const TextStyle(color: kDarkBlue),
                          decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff369FFF), width: 2),
                              ),
                              labelText: "Account ",
                              labelStyle: TextStyle(
                                  color: Color(0xff369FFF), fontSize: 14)),
                        ),
                        Positioned(
                          right: 1,
                          bottom: 8,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: const Color(0xFFF1F3F6),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(5, 5),
                                      color: const Color(0xff369FFF)
                                          .withOpacity(0.2),
                                      blurRadius: 16),
                                  const BoxShadow(
                                      offset: Offset(-10, -10),
                                      color: Color.fromARGB(170, 255, 255, 255),
                                      blurRadius: 10),
                                ]),
                            child: const Icon(
                              Icons.check,
                              color: Color(0xff369FFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(100),
                    ),
                    TextField(
                      controller: loginController.usernameTextEditingController,
                      style: const TextStyle(color: kDarkBlue),
                      decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff369FFF), width: 2),
                          ),
                          labelText: "Username",
                          labelStyle:
                              TextStyle(color: kDarkBlue, fontSize: 14)),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(100),
                    ),
                    TextField(
                      controller: loginController.passwordTextEditingController,
                      style: const TextStyle(color: kDarkBlue),
                      decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff369FFF), width: 2),
                          ),
                          labelText: "Password",
                          labelStyle:
                              TextStyle(color: kDarkBlue, fontSize: 14)),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(70),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            decoration: const BoxDecoration(
                                /*boxShadow: [
                            BoxShadow(
                                offset: Offset(5, 5),
                                color: Color(0xff369FFF).withOpacity(0.2),
                                blurRadius: 16),
                            BoxShadow(
                                offset: Offset(-10, -10),
                                color: Color.fromARGB(170, 255, 255, 255),
                                blurRadius: 10),
                          ]*/
                                )),
                        const SizedBox(
                          width: 10,
                        ),
                        Obx(
                          () => TextButton(
                            child: Text(
                              "Remember me",
                              style: TextStyle(
                                color: loginController.isRemembered.isTrue
                                    ? kDarkBlue
                                    : Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            onPressed: () {
                              loginController.rememberMe();
                            },
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(130),
                    ),
                    GestureDetector(
                      onTap: () {
                        loginController.login();
                        // Get.off(MainScreen());
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => MainScreen()));
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        height: ScreenUtil().setHeight(120),
                        margin: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                            color: Color(0xFFF1F3F6),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(10, 10),
                                  color: Color(0xff369FFF).withOpacity(0.2),
                                  blurRadius: 16),
                              const BoxShadow(
                                  offset: Offset(-10, -10),
                                  color: Color.fromARGB(170, 255, 255, 255),
                                  blurRadius: 10),
                            ]),
                        child: const Text("Login",
                            style: TextStyle(color: kDarkBlue, fontSize: 16)),
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }

  Widget socialButton(element) {
    return Container(
        height: ScreenUtil().setHeight(120),
        margin: const EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
            color: Color(0xFFF1F3F6),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(10, 10),
                  color: Color(0xff369FFF).withOpacity(0.2),
                  blurRadius: 16),
              const BoxShadow(
                  offset: Offset(-10, -10),
                  color: Color.fromARGB(170, 255, 255, 255),
                  blurRadius: 10),
            ]),
        child: element);
  }
}

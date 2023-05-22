// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sendatrack/screens/main_screen.dart';
import 'package:sendatrack/widgets/textFormField.dart';
import '../constant.dart';
import 'package:blurry/blurry.dart';

class AddTraject extends StatefulWidget {
  const AddTraject({super.key});

  @override
  State<AddTraject> createState() => _nameState();
}

class _nameState extends State<AddTraject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white.withAlpha(200),
        title: const Text('Add Traject',
            style: TextStyle(color: DarkBlueTest, fontWeight: FontWeight.w800)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Blurry.info(
                title: 'add traject',
                description:
                    'are you sure you want to add this traject to your list ?',
                confirmButtonText: 'Confirm',
                onConfirmButtonPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
                },
                barrierColor: Colors.white.withOpacity(0.7),
                dismissable: false,
              ).show(context);
            },
            child: const Text('Save',
                style: TextStyle(color: Colors.black, fontSize: 16)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
              child: Column(
                children: [
                  InputForm(),
                  SizedBox(
                    height: 20,
                  ),
                  InputForm(),
                  SizedBox(
                    height: 20,
                  ),
                  InputForm(),
                  SizedBox(
                    height: 20,
                  ),
                  InputForm(),
                  SizedBox(
                    height: 20,
                  ),
                  InputForm(),
                  SizedBox(
                    height: 20,
                  ),
                  InputForm(),
                  SizedBox(
                    height: 20,
                  ),
                  InputForm(),
                  SizedBox(
                    height: 20,
                  ),
                  InputForm(),
                  SizedBox(
                    height: 20,
                  ),
                  InputForm(),
                ],
              )),
        ),
      ),
    );
  }
}

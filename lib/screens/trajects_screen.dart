// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sendatrack/widgets/trajects_header.dart';
import '../widgets/projects_grid.dart';
import '../widgets/trajects_header.dart';
import 'package:sendatrack/constant.dart';
import 'package:sendatrack/screens/add_traject_page.dart';

class Trajects extends StatefulWidget {
  const Trajects({super.key});

  @override
  State<Trajects> createState() => _TrajectsState();
}

class _TrajectsState extends State<Trajects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TrajectsHeader(),
              const SizedBox(
                height: 20,
              ),
              const ProjectsGrid(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigate to another page when the FAB is clicked
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTraject()),
          );
        },
        backgroundColor: kDarkBlue,
        elevation: 1.0,
        icon: const Icon(Icons.add),
        label: const Text('Add Traject'),
      ),
    );
  }
}

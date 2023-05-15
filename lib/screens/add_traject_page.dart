import 'package:flutter/material.dart';

class AddTraject extends StatefulWidget {
  const AddTraject({super.key});

  @override
  State<AddTraject> createState() => _nameState();
}

class _nameState extends State<AddTraject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Traject'),
      ),
      body: const Center(
        child: Text('Add Traject'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materi_getx/controller.dart';

class Other extends StatelessWidget {
  final Controller c = Get.find();

  Other({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("${c.count}")),
    );
  }
}

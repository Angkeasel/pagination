import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page/controller/page_controller.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({Key? key, this.page}) : super(key: key);
  final int? page;
  @override
  Widget build(BuildContext context) {
    final con = Get.put(AppController());
    return Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.pink.shade50),
        child: Center(child: Obx(() => Text("${con.page.value}"))));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page/controller/page_controller.dart';

import 'custom_item_shimmer.dart';

class CustomCart extends StatelessWidget {
  CustomCart({Key? key, this.userId, this.id, this.title, this.body})
      : super(key: key);
  final int? userId;
  final int? id;
  final String? title;
  final String? body;
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          controller.isLoading.value
              ? const CustomListItemShimmer(
                  height: 15,
                  width: 100,
                  color: Colors.white,
                )
              : Text(
                  "UserID: $userId",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
          const SizedBox(
            height: 8,
          ),
          controller.isLoading.value
              ? const CustomListItemShimmer(
                  height: 15,
                  width: 50,
                  color: Colors.white,
                )
              : Text(
                  "ID: $id",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
          const SizedBox(
            height: 5,
          ),
          controller.isLoading.value
              ? const CustomListItemShimmer(
                  height: 15,
                  width: 200,
                  color: Colors.white,
                )
              : Text("Title: $title",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(
            height: 5,
          ),
          controller.isLoading.value
              ? const CustomListItemShimmer(
                  height: 15,
                  width: 100,
                  color: Colors.white,
                )
              : Text("Body: $body",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}

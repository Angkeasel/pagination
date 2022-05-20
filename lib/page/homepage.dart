import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page/config/router/router.gr.dart';

import 'package:page/controller/page_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final con = Get.put(AppController());
    return Scaffold(
      appBar: AppBar(
          title: const Text("GET API"), automaticallyImplyLeading: false),
      body: GestureDetector(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  context.pushRoute(const NextRoute());
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const NextPage()));
                  con.update();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.amber),
                  child: const Text("Get Api"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.pushRoute(const FiniteScrollRoute());
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const InfiniteScrollPage(),
                  //   ),
                  // );
                  con.update();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.amber),
                  child: const Text("Infinit Scroll"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

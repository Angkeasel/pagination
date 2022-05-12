import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:page/controller/page_controller.dart';

import 'next_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final con = Get.put(AppController());
    return Scaffold(
        appBar: AppBar(
            title: const Text("GET API"), automaticallyImplyLeading: false),
        body: GestureDetector(
          onTap: () {
            debugPrint("==============hello done");

            // context.pushRoute(const NextPageRouter());
            // context.router.pushNamed("nextpage");

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NextPage()));
            con.update();
          },
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.amber),
              child: const Text("Get Api"),
            ),
          ),
        ));
  }
}

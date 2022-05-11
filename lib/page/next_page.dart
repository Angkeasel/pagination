import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:page/controller/page_controller.dart';

import '../widget/custom_page.dart';

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  final controller = Get.put(AppController());

  @override
  void initState() {
    controller.getData(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SecondPage")),
      body: SizedBox(
        height: double.infinity,
        // child: Center(
        //   child: Text("data"),
        // ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: controller.wishList.asMap().entries.map((e) {
                    return Container(
                      child: Text(e.value.name.toString()),
                    );
                  }).toList(),
                ),
              ),
            ),
            showBottonPage()
          ],
        ),
      ),
    );
  }

  Widget showBottonPage() {
    return Container(
      color: Colors.amber,
      height: 50,
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                controller.discrease();
              },
              child: const Icon(Icons.arrow_back_ios_new)),
          const SizedBox(
            width: 10,
          ),
          const CustomPage(),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
              onTap: () {
                controller.increase();
              },
              child: const Icon(Icons.arrow_forward_ios)),
        ],
      ),
    );
  }
}

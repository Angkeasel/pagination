import 'package:flutter/material.dart';
import 'package:page/page/homepage.dart';

import '../../widget/custom_onboarding.dart';
import '../../widget/custom_skip.dart';
import '../../widget/custom_steprogress.dart';

class FastDeliveryScreen extends StatelessWidget {
  const FastDeliveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
          children: const [
            CustomSteprogress(
              status: 'fastDelivery',
              initColor: Colors.grey,
            ),
            CustomOnBoarding(
              url: 'assets/images/Group 427321822.svg',
              title: 'Fast Delivery',
              subTitle:
                  'Original with 1000 product from a lot of  different brand accros the world.',
            ),
          ],
        )),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 30, left: 25, right: 25),
          child: CustomSkip(
            onTapback: () {
              debugPrint("");
              Navigator.pop(context);
            },
            child: GestureDetector(
              onTap: () {
                debugPrint('====1234Helllo');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xff2B2F7E)),
                child: const Text(
                  "Get Start",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ));
  }
}

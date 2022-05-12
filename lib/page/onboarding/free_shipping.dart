import 'package:flutter/material.dart';
import 'package:page/page/onboarding/fast_delivery.dart';

import '../../widget/custom_onboarding.dart';
import '../../widget/custom_skip.dart';
import '../../widget/custom_steprogress.dart';

class FreeShippingScreen extends StatelessWidget {
  const FreeShippingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
          children: const [
            CustomSteprogress(
              status: 'freeShipping',
              initColor: Colors.grey,
            ),
            CustomOnBoarding(
              url: 'assets/images/Group 427321801.svg',
              title: 'Free shipping',
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FastDeliveryScreen()));
                },
                child: const Text("Skip")),
          ),
        ));
  }
}

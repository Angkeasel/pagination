import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:page/page/onboarding/free_shipping.dart';

import '../../widget/custom_onboarding.dart';
import '../../widget/custom_skip.dart';
import '../../widget/custom_steprogress.dart';

class OriginalProductScreen extends StatelessWidget {
  const OriginalProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
          children: const [
            CustomSteprogress(
              status: 'originalProduct',
              initColor: Colors.grey,
            ),
            CustomOnBoarding(
              url: 'assets/images/Certification-amico 1.svg',
              title: 'Original Product',
              subTitle:
                  'Original with 1000 product from a lot of  different brand accros the world. buy so easy with just simple step then your item will send it.',
            ),
          ],
        )),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 30, left: 25, right: 25),
          child: CustomSkip(
            onTapback: () {
              debugPrint("*******back");
              const GetSnackBar(
                title: "None",
                message: 'can not back',
              );
            },
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FreeShippingScreen()));
                  debugPrint("==================Original Product");
                },
                child: const Text("Skip")),
          ),
        ));
  }
}

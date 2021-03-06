// import 'dart:convert';
// import 'package:get/get.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:page/page/onboarding/fast_delivery.dart';
import 'package:page/page/onboarding/free_shipping.dart';
import 'package:page/page/onboarding/original_product.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:global_configuration/global_configuration.dart';

// import 'package:http/http.dart' as http;

class StartupSlide extends StatefulWidget {
  final bool? isNavigator;
  final String? locale;
  const StartupSlide({Key? key, this.locale, this.isNavigator})
      : super(key: key);
  @override
  _StartupSlideState createState() => _StartupSlideState();
}

class _StartupSlideState extends State<StartupSlide> {
  static const length = 3;
  final pageIndexNotifier = ValueNotifier<int>(0);

  int? selectedPage;
  // PageController? _pageController;

  List<Widget> pageView = [
    // const Schedule(),
    // const EasyPay(),
    // const QuickNotification(),
    const OriginalProductScreen(),
    const FreeShippingScreen(),
    const FastDeliveryScreen()
  ];
  int currentIndex = 0;
  final PageController _controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          widget.isNavigator != null && widget.isNavigator! ? true : false,
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              physics: const ClampingScrollPhysics(),
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
                // return pageIndexNotifier.value = index;
              },
              itemCount: length,
              itemBuilder: (context, index) {
                currentIndex = index;

                return pageView[currentIndex];
              },
            ),
            Positioned(
              left: kIsWeb ? 0 : 20.0,
              right: kIsWeb ? 0 : null,
              bottom: MediaQuery.of(context).size.height * 0.1,
              child: PageViewDotIndicator(
                currentItem: currentIndex,
                count: pageView.length,
                unselectedColor: Colors.black26,
                selectedColor: Theme.of(context).primaryColor,
                duration: const Duration(milliseconds: 200),
              ),
            ),
            Positioned(
                right: 20,
                left: currentIndex == 2 ? 20 : null,
                bottom: MediaQuery.of(context).size.height * 0.08,
                child: SizedBox(
                    height: 50,
                    width: currentIndex == 2
                        ? MediaQuery.of(context).size.width
                        : 200,
                    child: Column(
                      children: [
                        if (currentIndex == 2) Container(),
                        // CustomButton(
                        //   isDisable: false,
                        //   isOutline: false,
                        //   title: 'Get Start',
                        //   onPressed: () {
                        //     // Beamer.of(context)
                        //     //     .beamToNamed('/on_boarding/construct_term');
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) =>
                        //                 const ContractTerm()));
                        //     debugPrint("got to contruct term");
                        //   },
                        // )
                      ],
                    ))),
            if (currentIndex != 2)
              Positioned(
                right: 10,
                bottom: MediaQuery.of(context).size.height * 0.08,
                child: GestureDetector(
                  onTap: () {
                    _controller.animateToPage(currentIndex + 1,
                        duration: const Duration(seconds: 1),
                        curve: Curves.ease);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "",
                      // S.of(context).continueButton,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ),
            // if (currentIndex == 2)
            //   Positioned(
            //     bottom: MediaQuery.of(context).size.height * 0.01,
            //     child: GestureDetector(
            //       onTap: () {
            //         _controller.animateToPage(currentIndex + 1,
            //             duration: const Duration(seconds: 1),
            //             curve: Curves.ease);
            //       },
            //       child: Container(
            //         margin: const EdgeInsets.all(10),
            //         padding: const EdgeInsets.all(10),
            //         child: const Text(
            //           'Terms & Condition Applied',
            //           style: TextStyle(color: Colors.black),
            //         ),
            //       ),
            //     ),
            //   ),
            // Positioned(
            //   top: 50,
            //   right: 20,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       GestureDetector(
            //         key: const Key("SkipStartSlide"),
            //         onTap: () {
            //           // Beamer.of(context)
            //           //     .beamToNamed('/on_boarding/construct_term');
            //           // Navigator.push(
            //           //     context,
            //           //     MaterialPageRoute(
            //           //         builder: (context) => const ContractTerm()));
            //         },
            //        // child: const Text('Skip'),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

// class Schedule extends StatefulWidget {
//   const Schedule({Key? key}) : super(key: key);

//   @override
//   _ScheduleState createState() => _ScheduleState();
// }

// class _ScheduleState extends State<Schedule> {
//   Future<void> getLanguage() async {
//    // SharedPreferences prefs = await SharedPreferences.getInstance();
//     S.load(
//       Locale(
//         prefs.getString('locale')!,
//       ),
//     );
//   }

//   TermAndCondition supportMode = TermAndCondition();

//   String locale = '';

//   Future<TermAndCondition> getTermandCondition() async {
//     getCurrentLocal();
//     String url = '${GlobalConfiguration().getValue('api_base_url')}support';
//     await http.get(Uri.parse(url)).then((response) {
//       if (response.statusCode == 200) {
//         var responseData = json.decode(response.body);
//         setState(() {
//           supportMode = TermAndCondition.fromJson(responseData);
//         });
//       } else {
//         Get.snackbar('Error', 'Sorry! we are fixing bug');
//       }
//     });
//     return supportMode;
//   }

//   Future<void> getCurrentLocal() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     setState(() {
//       locale = pref.getString('locale')!;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final mediaHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           const SizedBox(
//             width: double.infinity,
//             height: double.infinity,
//           ),
//           Positioned(
//               top: MediaQuery.of(context).size.height * 0.17,
//               child: SvgPicture.asset('assets/images/svgfile/welcomeCiC.svg')),
//           Positioned(
//               top: mediaHeight * 0.55,
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 50,
//                   ),
//                   Text(
//                     'Welcome to CiC app',
//                     style: TextStyle(
//                         fontFamily: 'Montserrat',
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 2,
//                         color: Get.theme.brightness == Brightness.light
//                             ? Colors.black
//                             : Colors.white),
//                   ),
//                   const SizedBox(
//                     height: 30.0,
//                   ),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.8,
//                     child: Text(
//                       'The one-stop digital solutions for all CiC Members. CiC Plc is the community-based alternative and innovative financing solution company.',
//                       style: Theme.of(context).textTheme.subtitle2,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ],
//               )),
//         ],
//       ),
//     );
//   }
// }

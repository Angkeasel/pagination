import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page/config/router/router.gr.dart';

import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
      // home: StartupSlide(),
    );
  }
}

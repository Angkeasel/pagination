// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../page/hello.dart' as _i3;
import '../../page/homepage.dart' as _i1;
import '../../page/next_page.dart' as _i2;
import '../../page/onboarding/infinit_scroll.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    NextRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.NextPage());
    },
    HelloRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HelloPage());
    },
    FiniteScrollRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.InfiniteScrollPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(HomeRoute.name, path: '/'),
        _i5.RouteConfig(NextRoute.name, path: 'nextpage'),
        _i5.RouteConfig(HelloRoute.name, path: 'hello'),
        _i5.RouteConfig(FiniteScrollRoute.name, path: 'finiteScroll')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.NextPage]
class NextRoute extends _i5.PageRouteInfo<void> {
  const NextRoute() : super(NextRoute.name, path: 'nextpage');

  static const String name = 'NextRoute';
}

/// generated route for
/// [_i3.HelloPage]
class HelloRoute extends _i5.PageRouteInfo<void> {
  const HelloRoute() : super(HelloRoute.name, path: 'hello');

  static const String name = 'HelloRoute';
}

/// generated route for
/// [_i4.InfiniteScrollPage]
class FiniteScrollRoute extends _i5.PageRouteInfo<void> {
  const FiniteScrollRoute()
      : super(FiniteScrollRoute.name, path: 'finiteScroll');

  static const String name = 'FiniteScrollRoute';
}

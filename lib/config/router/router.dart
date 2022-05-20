import 'package:auto_route/auto_route.dart';
import 'package:page/page/hello.dart';
import 'package:page/page/homepage.dart';
import 'package:page/page/next_page.dart';

import '../../page/onboarding/infinit_scroll.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: NextPage, path: 'nextpage', name: 'NextRoute'),
    AutoRoute(page: HelloPage, path: 'hello', name: 'HelloRoute'),
    AutoRoute(page: InfiniteScrollPage, path: 'finiteScroll', name: 'finiteScrollRoute'),
  ],
)
class $AppRouter {}

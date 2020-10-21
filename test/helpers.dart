import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nuvigator/nuvigator.dart';

class TestRouter extends NuRouter {
  @override
  Map<RoutePath, ScreenRouteBuilder> get screensMap => {
        RoutePath('test/simple', prefix: false): (_) => ScreenRoute(
              builder: (sc) => null,
              debugKey: 'testRouterFirstScreen',
              screenType: materialScreenType,
            ),
        RoutePath('test/:id/params', prefix: false): (_) => ScreenRoute(
              builder: (sc) => null,
              debugKey: 'testRouterSecondScreen',
              screenType: materialScreenType,
            ),
      };
}

class TestRouterWPrefix extends NuRouter {
  @override
  String get deepLinkPrefix => 'testapp://prefix/';

  @override
  Map<RoutePath, ScreenRouteBuilder> get screensMap => {
        RoutePath('test/simple'): (_) => ScreenRoute(
              builder: (sc) => null,
              debugKey: 'testRouterFirstScreen',
              screenType: materialScreenType,
            ),
        RoutePath('test/:id/params'): (_) => ScreenRoute(
              builder: (sc) => null,
              debugKey: 'testRouterSecondScreen',
              screenType: materialScreenType,
            ),
      };
}

class TestRouterWWrapper extends NuRouter {
  @override
  Map<RoutePath, ScreenRouteBuilder> get screensMap => {
        RoutePath('test/simple'): (_) => ScreenRoute(
              builder: (sc) => null,
              debugKey: 'testRouterFirstScreen',
              screenType: materialScreenType,
            ),
        RoutePath('test/:id/params'): (_) => ScreenRoute(
              builder: (sc) => null,
              debugKey: 'testRouterSecondScreen',
              screenType: materialScreenType,
            ),
      };
}

class GroupTestRouter extends NuRouter {
  @override
  String get deepLinkPrefix => 'group/';

  TestRouter testRouter = TestRouter();

  @override
  List<NuRouter> get routers => [
        testRouter,
      ];

  @override
  Map<RoutePath, ScreenRouteBuilder> get screensMap => {
        RoutePath('route/test'): (settings) => ScreenRoute(
              builder: (sc) => null,
              debugKey: 'groupRouterFirstScreen',
              screenType: cupertinoScreenType,
            ),
      };
}

class MockNuvigator extends NuvigatorState {
  MockNuvigator(this.router);

  String routePushed;
  Object argumentsPushed;
  @override
  final NuRouter router;

  @override
  NuvigatorState<NuRouter> get rootNuvigator => this;

  @override
  Future<T> pushNamed<T extends Object>(String routeName,
      {Object arguments}) async {
    routePushed = routeName;
    argumentsPushed = arguments;
    return null;
//    return super.pushNamed(routeName, arguments);
  }
}

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}

Widget testApp(NuRouter router, String initialDeepLink, [WrapperFn wrapper]) {
  return MaterialApp(
    builder: Nuvigator(
      router: router,
      initialRoute: initialDeepLink,
      wrapper: wrapper,
    ),
  );
}

Future pumpApp(
    WidgetTester tester, NuRouter router, String initialRoute) async {
  await tester.pumpWidget(MaterialApp(
    title: 'Test Nuvigator',
    builder: Nuvigator(
      screenType: cupertinoDialogScreenType,
      router: router,
      initialRoute: initialRoute,
    ),
  ));
}

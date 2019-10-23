// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_one_router.dart';

// **************************************************************************
// NuvigatorGenerator
// **************************************************************************

class SampleOneRoutes {
  static const screenOne = 'sampleOne/screenOne';

  static const screenTwo = 'sampleOne/screenTwo';
}

class ScreenOneArgs {
  ScreenOneArgs({@required this.testId});

  final String testId;

  static ScreenOneArgs parse(Map<String, Object> args) {
    return ScreenOneArgs(
      testId: args['testId'],
    );
  }

  static ScreenOneArgs of(BuildContext context) {
    final routeSettings = ModalRoute.of(context)?.settings;
    final nuvigator = Nuvigator.of(context);
    if (routeSettings?.name == SampleOneRoutes.screenOne) {
      final args = routeSettings?.arguments;
      if (args is ScreenOneArgs) return args;
      if (args is Map<String, Object>) return parse(args);
    } else if (nuvigator != null) {
      return of(nuvigator.context);
    }
    return null;
  }
}

abstract class ScreenOneScreen extends ScreenWidget {
  ScreenOneScreen(BuildContext context) : super(context);

  ScreenOneArgs get args => ScreenOneArgs.of(context);
  SampleOneNavigation get sampleOneNavigation =>
      SampleOneNavigation.of(context);
}

class SampleOneNavigation {
  SampleOneNavigation(this.nuvigator);

  final NuvigatorState nuvigator;

  static SampleOneNavigation of(BuildContext context) =>
      SampleOneNavigation(Nuvigator.of(context));
  Future<Object> toScreenOne({@required String testId}) {
    return nuvigator.pushNamed<Object>(SampleOneRoutes.screenOne, arguments: {
      'testId': testId,
    });
  }

  Future<int> toScreenTwo() {
    return nuvigator.pushNamed<int>(SampleOneRoutes.screenTwo);
  }
}

Map<RouteDef, ScreenRouteBuilder> _$sampleOneScreensMap(
    SampleOneRouter router) {
  return {
    RouteDef(SampleOneRoutes.screenOne, deepLink: 'screenOne/:testId'):
        (RouteSettings settings) {
      final Map<String, Object> args = settings.arguments;
      return router.screenOne(testId: args['testId']);
    },
    RouteDef(SampleOneRoutes.screenTwo): (RouteSettings settings) {
      return router.screenTwo();
    },
  };
}

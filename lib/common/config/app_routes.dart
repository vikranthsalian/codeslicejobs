import 'package:codeslicejobs/common/constants/route_constants.dart';
import 'package:codeslicejobs/presentation/screen/login_screen.dart';
import 'package:codeslicejobs/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {

  Route generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
        builder: (_) => getScreen(routeSettings),
        settings: routeSettings
    );
  }

  Widget getScreen(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    debugPrint("ROUTED:===============>"+routeSettings.name.toString());
    switch(routeSettings.name) {
      case RouteConstants.splashPath:
        return LoginScreen();
      case RouteConstants.loginPath:
        return LoginScreen();

      default:
        return SplashScreen();
    }
  }

}
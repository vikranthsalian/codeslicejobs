import 'package:codeslicejobs/common/constants/route_constants.dart';
import 'package:codeslicejobs/presentation/screen/chat_screen.dart';
import 'package:codeslicejobs/presentation/screen/detail_screen.dart';
import 'package:codeslicejobs/presentation/screen/nav_screen.dart';
import 'package:codeslicejobs/presentation/screen/login_screen.dart';
import 'package:codeslicejobs/presentation/screen/splash_screen.dart';
import 'package:codeslicejobs/presentation/screen/upload_screen.dart';
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
        return NavScreen();

      case RouteConstants.loginPath:
        return LoginScreen();

        case RouteConstants.homePath:
        return NavScreen();

        case RouteConstants.detailPath:
        return DetailScreen();

        case RouteConstants.uploadPath:
        return UploadScreen();

        case RouteConstants.chatPath:
        return ChatScreen();

      default:
        return SplashScreen();
    }
  }

}
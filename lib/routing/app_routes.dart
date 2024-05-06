import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:racemate/features/home/presentation/home_screen.dart';
import 'package:racemate/splash_screen.dart';

enum AppRoute{
  splashScreen,
  homeScreen,
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter{
  static Map<String, dynamic> routes = {
    AppRoute.splashScreen.name: const SplashScreen(),
    AppRoute.homeScreen.name: const HomeScreen(),
  };

  static Route _navigate(Widget widget) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(builder: (_) => widget);
    }else{
      return MaterialPageRoute(builder: (_) => widget);
    }
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return _navigate(routes[settings.name]);
  }
}
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urban_attires/ui/views/home_page.dart';
import 'package:urban_attires/ui/views/item_page.dart';
import 'package:urban_attires/ui/views/onboarding_screens.dart';

import '../main.dart';

const String mainRoute = '/';
const String homeRoute = '/home';
const String onboardingRoute = '/onboarding';
const String itemPageRoute = '/item_page';

const String initialRoute = "login";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainRoute:
        if (Platform.isIOS)
          return CupertinoPageRoute(
              builder: (_) => MainPage(), settings: settings);
        return MaterialPageRoute(
            builder: (_) => MainPage(), settings: settings);
        break;
      case homeRoute:
        if (Platform.isIOS)
          return CupertinoPageRoute(
              builder: (_) => HomePage(), settings: settings);
        return MaterialPageRoute(
            builder: (_) => HomePage(), settings: settings);
        break;
      case onboardingRoute:
        if (Platform.isIOS)
          return CupertinoPageRoute(
              builder: (_) => OnBoardingScreen(), settings: settings);
        return MaterialPageRoute(
            builder: (_) => OnBoardingScreen(), settings: settings);
        break;
      case itemPageRoute:
        if (Platform.isIOS)
          return CupertinoPageRoute(
              builder: (_) => ItemPage(), settings: settings);
        return MaterialPageRoute(
            builder: (_) => ItemPage(), settings: settings);
        break;
      // case 'post':
      //   var post = settings.arguments as Post;
      //   return MaterialPageRoute(builder: (_) => PostView(post: post));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}

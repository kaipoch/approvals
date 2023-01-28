import 'package:approvals/screens/main_page/main_page.dart';
import 'package:approvals/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  MainPage.routeName: (context) => const MainPage()
};

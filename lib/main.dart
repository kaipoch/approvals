import 'package:approvals/models/approval_provider_model.dart';
import 'package:approvals/models/query_provider_model.dart';
import 'package:approvals/routes.dart';
import 'package:approvals/screens/splash/splash_screen.dart';
import 'package:approvals/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ApprovalProviderModel()),
      ChangeNotifierProvider(create: (context) => QueryProviderModel())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Approvals',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}

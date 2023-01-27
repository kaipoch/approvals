import 'package:approvals/screens/login_page/login_page.dart';
import 'package:approvals/screens/main_page/main_page.dart';
import 'package:approvals/services/secure_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final SecureStorage secureStorage = SecureStorage();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: secureStorage.readSecureData('jwt'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var jwt = snapshot.data;
            if (jwt == null || jwt == "") {
              Future.delayed(Duration.zero, () async {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              });
            } else {
              Future.delayed(Duration.zero, () async {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const MainPage()));
              });
            }
          }
          return Center(
            child: SvgPicture.asset(
              "assets/icons/ezeelogo.svg",
              fit: BoxFit.cover,
              height: 100,
            ),
          );
        });
  }
}

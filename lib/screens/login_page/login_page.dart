import "package:approvals/constants.dart";
import "package:approvals/screens/login_page/components/body.dart";
import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.white, body: Body());
  }
}

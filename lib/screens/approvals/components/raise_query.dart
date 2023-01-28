import 'package:approvals/constants.dart';
import 'package:flutter/material.dart';

class RaiseQueryScreen extends StatelessWidget {
  const RaiseQueryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: homeScreenPrimaryColor,
        title: const Text(
          "RAISE QUERY",
          style: TextStyle(
              color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 13),
          textScaleFactor: 1.0,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:approvals/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF6C08D1),
                          minimumSize: const Size(double.infinity, 0)),
                      onPressed: () => {},
                      child: const Text("Sign Up"))
                ],
              )))
    ]);
  }
}

import "package:approvals/constants.dart";
import "package:approvals/services/login_service.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _emailFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();
  final loginService = LoginService();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.asset(
            "assets/icons/ezeelogo.svg",
            fit: BoxFit.cover,
            height: 100,
            alignment: Alignment.center,
          ),
        ),
        const SizedBox(height: 50),
        Form(
          key: _emailFormKey,
          child: Padding(
            padding: const EdgeInsets.only(right: 26, left: 26),
            child: TextFormField(
                key: const Key('Email'),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                controller: _emailController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                  hintText: 'Email Id',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Mobile Number is required';
                  }
                  if (val.length != 10) {
                    return 'Please enter a valid mobile number';
                  }
                  return null;
                },
                cursorColor: Colors.black),
          ),
        ),
        const SizedBox(height: 10),
        Form(
          key: _passwordFormKey,
          child: Padding(
            padding: const EdgeInsets.only(right: 26, left: 26),
            child: TextFormField(
                obscureText: true,
                key: const Key('Password'),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                controller: _passwordController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Mobile Number is required';
                  }
                  if (val.length != 10) {
                    return 'Please enter a valid mobile number';
                  }
                  return null;
                },
                cursorColor: Colors.black),
          ),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            loginService.verifyLogin(
                _emailController.text, _passwordController.text);
          },
          child: Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: kSecondaryColor,
            ),
            child: const Center(
                child: Text('Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20))),
          ),
        )
      ],
    );
  }
}

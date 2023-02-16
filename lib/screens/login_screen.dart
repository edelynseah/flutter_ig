// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proj1/responsive/mobile_screen_layout.dart';
import 'package:proj1/screens/signup_screen.dart';
import 'package:proj1/widgets/text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // to clear out the data inside the email and pw controller after the login page
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              // padding is only at the top

              padding: const EdgeInsets.symmetric(vertical: 50),
              width: MediaQuery.of(context).size.width,
              child: Column(
                // crossAxisAlignment is for column
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/ic_instagram.svg',
                      height: MediaQuery.of(context).size.height / 15),
                  // Container because the size of the box is not fixed to make padding
                  Container(height: MediaQuery.of(context).size.height / 15),

                  // text input box for email and password
                  Container(
                      width: MediaQuery.of(context).size.width - 50,
                      child: textInput(
                          hintText: 'Enter your email',
                          textEditingController: _emailController,
                          textInputType: TextInputType.emailAddress)),

                  const SizedBox(height: 10),

                  Container(
                      width: MediaQuery.of(context).size.width - 50,
                      child: textInput(
                          hintText: 'Enter your password',
                          textEditingController: _passwordController,
                          textInputType: TextInputType.visiblePassword,
                          isPass: true)),

                  Container(height: MediaQuery.of(context).size.height / 30),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MobileScreenLayout()),
                        );
                      },
                      child: Ink(
                          color: Colors.blue,
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.width / 15,
                          child: const Center(
                              child: Text('Log in',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))))),
                  Container(height: MediaQuery.of(context).size.height / 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        const Text('Don\'t have an account?'),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen()),
                        );
                          },
                          child:
                            const Text('Sign up now.', style: TextStyle(fontWeight: FontWeight.bold))
                          ),
                ]),]
              ))),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proj1/widgets/text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [SvgPicture.asset('assets/ic_instagram.svg',
                 height: 64),

                 const SizedBox(height: 64),
                 // text input box for email
                 textInput(
                  hintText: 'Enter your email', 
                  textEditingController: _emailController, 
                  textInputType: TextInputType.emailAddress,
                  
                 ),
                  textInput(
                  hintText: 'Enter your password', 
                  textEditingController: _passwordController, 
                  textInputType: TextInputType.visiblePassword,
                  
                 )                  
                  ],
              ))),
    );
  }
}

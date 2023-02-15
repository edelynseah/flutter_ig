import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proj1/widgets/text_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  // to clear out the data inside the email and pw controller after the signup page
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
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
                  // add circular widget for image
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 64,
                        // add random image temporarily
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80'),
                      ),
                      Positioned(
                        bottom: -10,
                        left:90,
                          child: IconButton(
                              onPressed: () {}, 
                              icon: const Icon(Icons.add_a_photo,),
                              color: Colors.blue,
                              ),
                              )
                    ],
                  ),

                  const SizedBox(height: 20),
                  // text input box for username, bio, email and password
                  Container(
                      width: MediaQuery.of(context).size.width - 50,
                      child: textInput(
                          hintText: 'Enter your username',
                          textEditingController: _usernameController,
                          textInputType: TextInputType.text)),

                  const SizedBox(height: 10),

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
                  const SizedBox(height: 10),

                  Container(
                      width: MediaQuery.of(context).size.width - 50,
                      child: textInput(
                          hintText: 'Enter your bio',
                          textEditingController: _bioController,
                          textInputType: TextInputType.text)),

                  const SizedBox(height: 10),

                  Container(height: MediaQuery.of(context).size.height / 30),
                  InkWell(
                      onTap: () {},
                      child: Ink(
                          color: Colors.blue,
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.width / 15,
                          child: const Center(
                              child: Text('Sign up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))))),
                  Container(height: MediaQuery.of(context).size.height / 30),
                  GestureDetector(
                      child: Row(
                          // mainAxisAlignment is for row
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                        Text('Already have an account?'),
                        SizedBox(width: 5),
                        Text('Log in now.',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ]))
                ],
              ))),
    );
  }
}

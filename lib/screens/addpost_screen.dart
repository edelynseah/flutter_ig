import 'package:flutter/material.dart';
import 'package:proj1/screens/signup_screen.dart';
import 'package:proj1/utils/global.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: IconButton(icon: const Icon(Icons.upload),
    //   onPressed: () {},)
    // );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignupScreen()),
            );
          },
        ),
        title: const Text('Post to',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: false,
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text('Post',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)))
        ],
      ),
      body: Column(children: [
        CircleAvatar(
          backgroundImage: img,
        )
      ],)
    );
  }
}

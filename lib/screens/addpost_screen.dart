import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proj1/screens/signup_screen.dart';
import 'package:proj1/utils/global.dart';
import 'package:proj1/widgets/text_input.dart';

import '../utils/utils.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;

  // dialog box pop up to select where user wants to upload from
  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(title: const Text('Create a Post'), children: [
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              //
              child: const Text('Take a photo'),
              onPressed: () async {
                // dismiss dialog block and then
                Navigator.of(context).pop();
                Uint8List file = await PickImage(ImageSource.camera);
                setState(() {
                  _file = file;
                });
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              //
              child: const Text('Choose from Gallery'),
              onPressed: () async {
                // dismiss dialog block and then
                Navigator.of(context).pop();
                Uint8List file = await PickImage(ImageSource.gallery);
                setState(() {
                  _file = file;
                });
              },
            )
          ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return _file == null
        ? Center(
            child: IconButton(
            icon: const Icon(Icons.upload),
            onPressed: ()=> _selectImage(context),
          ))
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignupScreen()),
                  );
                },
              ),
              title: const Text('Post to',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
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
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundImage: img,
                    ),
                    Container(
                        padding: const EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width - 100,
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Write a caption...',
                            border: InputBorder.none,
                          ),
                          // scroll view with number of lines wah
                          maxLines: 3,
                        )),
                    SizedBox(
                        height: 45,
                        width: 45,
                        child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Container(
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://images.unsplash.com/photo-1524715105103-1eb12bf063c5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                                        fit: BoxFit.fill,
                                        alignment:
                                            FractionalOffset.topCenter)))))
                  ],
                )
              ],
            ));
  }
}

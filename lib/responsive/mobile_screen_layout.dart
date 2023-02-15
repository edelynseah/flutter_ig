import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: InkWell(
                onTap: () {
                  Navigator.pop(
                    context
                  );
                },
                child: Ink(
                    color: Colors.blue,
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 15,
                    child: const Center(
                        child: Text('Go Back',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)))))));
  }
}

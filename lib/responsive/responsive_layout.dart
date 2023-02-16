import 'package:flutter/material.dart';
import 'package:proj1/utils/global.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget WebScreenLayout;
  final Widget MobileScreenLayout;
  const ResponsiveLayout({
    Key? key,
    required this.WebScreenLayout,
    required this.MobileScreenLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          //webscreen (in utils)
          return WebScreenLayout;
        }
        return MobileScreenLayout;
      },
    );
  }
}

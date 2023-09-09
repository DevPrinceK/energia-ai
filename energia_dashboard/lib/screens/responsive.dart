import 'package:energia_dashboard/constants/screen_sizes.dart';
import 'package:flutter/material.dart';

class ResponsiveScreen extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const ResponsiveScreen({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < ScreenSize.mobile) {
          return mobile;
        } else if (constraints.maxWidth < ScreenSize.tablet) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }
}

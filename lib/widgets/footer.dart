import 'package:flutter/material.dart';
import 'package:CyTech_Austraia_Dev/styles.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Text(
          "© 2024 Your Company. All Rights Reserved.",
          style: defaultTextStyle,
        ),
      ),
    );
  }
}

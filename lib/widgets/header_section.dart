import 'package:flutter/material.dart';
import 'package:CyTech_Austraia_Dev/styles.dart'; // styles.dart をインポート

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250, // Adjust height based on your design
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "プログラミングで世界をデザイン",
              style: defaultTextStyle.copyWith(
                // styles.dart の defaultTextStyle を使用
                color: Colors.white, // Override the color
                fontSize: 75,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "- CyTech -",
              style: defaultTextStyle.copyWith(
                color: Colors.white, // Override the color
                fontSize: 55,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "オンラインプログラミング学習",
              style: defaultTextStyle.copyWith(
                color: Colors.white, // Override the color
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

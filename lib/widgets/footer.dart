import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import Font Awesome package

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "© 2025 CyTech - All Rights Reserved.",
            style: TextStyle(color: Color(0xFF001668), fontSize: 14),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon:
                    const FaIcon(FontAwesomeIcons.twitter), // Font Awesome icon
                color: const Color(0xFF001668),
                onPressed: () {
                  // Add Twitter URL or action
                },
              ),
              IconButton(
                icon: const FaIcon(
                    FontAwesomeIcons.instagram), // Font Awesome icon
                color: const Color(0xFF001668),
                onPressed: () {
                  // Add Instagram URL or action
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

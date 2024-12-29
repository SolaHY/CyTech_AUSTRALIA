import 'package:flutter/material.dart';
import 'package:CyTech_Austraia_Dev/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import Font Awesome package

// class Footer extends StatelessWidget {
//   const Footer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       child: Center(
//         child: Text(
//           "© 2024 Your Company. All Rights Reserved.",
//           style: defaultTextStyle,
//         ),
//       ),
//     );
//   }
// }

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[900],
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            "© 2024 CyTech - All Rights Reserved.",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon:
                    const FaIcon(FontAwesomeIcons.twitter), // Font Awesome icon
                color: Colors.white,
                onPressed: () {
                  // Add Twitter URL or action
                },
              ),
              IconButton(
                icon: const FaIcon(
                    FontAwesomeIcons.instagram), // Font Awesome icon
                color: Colors.white,
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

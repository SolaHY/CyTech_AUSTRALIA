import 'package:flutter/material.dart';
import 'package:CyTech_Austraia_Dev/styles.dart';

class ContactFormWidget extends StatelessWidget {
  const ContactFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(120, 80, 120, 80),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 2), // Shadow position
          ),
        ],
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Animated Title Section
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF001668), Color(0xFF2196F3)],
            ).createShader(bounds),
            child: const Text(
              "Contact Us",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "お問い合わせ",
            style: TextStyle(
              fontSize: 24,
              color: Colors.black54.withOpacity(0.8),
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 32),
          const TextField(
            decoration: InputDecoration(labelText: "Your Name"), // Name
          ),
          const SizedBox(height: 8),
          const TextField(
            decoration: InputDecoration(labelText: "Your Email"), // Email
          ),
          const SizedBox(height: 8),
          const TextField(
            decoration: InputDecoration(labelText: "Your Message"), // Message
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Add your send message logic here
            },
            style: buttonStyle,
            child: const Text("Send Message"), // Send Button
          ),
        ],
      ),
    );
  }
}

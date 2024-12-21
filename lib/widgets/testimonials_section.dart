import 'package:flutter/material.dart';
import 'package:CyTech_Austraia_Dev/styles.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Testimonials",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            "\"This platform has changed my life! Highly recommended!\" - Happy Customer",
            style: defaultTextStyle,
          ),
        ],
      ),
    );
  }
}

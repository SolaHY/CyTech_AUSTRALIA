import 'package:flutter/material.dart';
import 'package:CyTech_Austraia_Dev/styles.dart';

class CoursesSection extends StatelessWidget {
  const CoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Our Courses",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            "Explore a wide range of courses designed to help you achieve your goals.",
            style: defaultTextStyle,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: buttonStyle,
            child: const Text("View Courses"),
          ),
        ],
      ),
    );
  }
}

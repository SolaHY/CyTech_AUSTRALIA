import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CoursesSection extends StatelessWidget {
  const CoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> courses = [
      {
        "title": "HTML & CSS",
        "description": "Webページの基礎をマスターしましょう。",
        "icon": FontAwesomeIcons.html5,
        "color": Colors.blueAccent,
      },
      {
        "title": "JavaScript",
        "description": "Webプロジェクトに動的な機能性を追加する方法を学びましょう。",
        "icon": FontAwesomeIcons.js,
        "color": Colors.yellowAccent,
      },
      {
        "title": "Java",
        "description": "Javaを使用してWebアプリを構築しましょう。",
        "icon": FontAwesomeIcons.java,
        "color": Colors.purpleAccent,
      },
      {
        "title": "PHP",
        "description": "PHPを使用してWebアプリを構築しましょう。",
        "icon": FontAwesomeIcons.php,
        "color": Colors.greenAccent,
      },
      {
        "title": "SQL",
        "description": "SQLを使ってデータベースの操作と効率的なデータ管理を学びます。",
        "icon": FontAwesomeIcons.database,
        "color": Colors.orangeAccent,
      },
    ];

    return Container(
      padding: const EdgeInsets.fromLTRB(120, 80, 120, 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Animated Title Section
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF001668), Color(0xFF2196F3)],
            ).createShader(bounds),
            child: const Text(
              "Learn at CyTech",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "CyTechで学べること",
            style: TextStyle(
              fontSize: 24,
              color: Colors.black54.withOpacity(0.8),
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 32),
          // Horizontal List of Courses
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: courses.map((course) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _buildCourseCard(
                    title: course["title"],
                    description: course["description"],
                    icon: course["icon"],
                    color: course["color"],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Function to Build Course Cards
  Widget _buildCourseCard({
    required String title,
    required String description,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      width: 300, // Fixed width for each card
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon with Background
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 36,
            ),
          ),
          const SizedBox(height: 15),
          // Course Title
          SelectableText(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF001668),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          // Course Description
          SelectableText(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

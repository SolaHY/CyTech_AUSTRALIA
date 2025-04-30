import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// 形式: {"avatar": "assets/images/画像名.拡張子", "link": "リンクURL"}
final List<Map<String, String>> testimonials = [
  {
    "avatar": "assets/images/3.png",
    "link": "https://cytechbridge.com/interview/case_study10/",
  },
  {
    "avatar": "assets/images/6.png",
    "link": "https://cytechbridge.com/interview/case_study9/",
  },
  {
    "avatar": "assets/images/8.png",
    "link": "https://cytechbridge.com/interview/case_study8/",
  },
];

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 80, 24, 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Animated Title Section
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF001668), Color(0xFF2196F3)],
            ).createShader(bounds),
            child: const Text(
              "Learner Testimonials",
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "学習者の声を聞いてみましょう。",
            style: TextStyle(
              fontSize: 24,
              color: Colors.black54.withOpacity(0.8),
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 32),
          // Horizontal List of Testimonials
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: testimonials.map((testimonial) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _buildTestimonialCard(
                    avatar: testimonial["avatar"]!,
                    link: testimonial["link"],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Function to Build Testimonial Cards
  Widget _buildTestimonialCard({
    required String avatar,
    String? link,
  }) {
    return GestureDetector(
      onTap: () async {
        if (link != null) {
          final Uri url = Uri.parse(link);
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          }
        }
      },
      child: Container(
        width: 500,
        height: 315,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Image.asset(
          avatar,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            print('Asset image error: $error');
            return const Center(
              child: Icon(Icons.error, size: 50, color: Colors.red),
            );
          },
        ),
      ),
    );
  }
}

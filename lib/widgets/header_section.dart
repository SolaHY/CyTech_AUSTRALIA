import 'package:flutter/material.dart';
import 'package:CyTech_Austraia_Dev/styles.dart'; // styles.dart をインポート

class HeaderSection extends StatelessWidget {
  final Function(String) onNavItemTap;

  const HeaderSection({
    super.key,
    required this.onNavItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Stack(
        children: [
          // Add world map background
          Positioned.fill(
            child: Image.asset(
              'assets/images/world_map_rainbow.png',
              fit: BoxFit.cover,
            ),
          ),
          // Navigation menu - no horizontal padding
          Positioned(
            top: 24,
            right: 24,
            child: Row(
              children: [
                _navButton('Why Us', () => onNavItemTap('whyus')),
                const SizedBox(width: 24),
                _navButton('Curriculum', () => onNavItemTap('curriculum')),
                const SizedBox(width: 24),
                _navButton('Testimonials', () => onNavItemTap('testimonials')),
                const SizedBox(width: 24),
                _navButton('Contact Us', () => onNavItemTap('contact')),
              ],
            ),
          ),
          // Logo - no horizontal padding
          Positioned(
            top: 24,
            left: 24,
            child: Image.asset(
              'assets/images/ct_logo_w.png',
              height: 70,
              fit: BoxFit.contain,
            ),
          ),
          // Main content with margins
          Padding(
            padding: const EdgeInsets.fromLTRB(120, 160, 120, 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  "プログラミングで",
                  style: defaultTextStyle.copyWith(
                    color: const Color(0xFF001668),
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 8),
                SelectableText(
                  "世界をデザインしよう",
                  style: defaultTextStyle.copyWith(
                    color: const Color(0xFF001668),
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for navigation buttons
  Widget _navButton(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

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
      height: 900, // Increased height to accommodate content
      child: Stack(
        children: [
          // Add world map background with overlay
          Positioned.fill(
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/world_map_rainbow.png',
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Navigation menu
          Positioned(
            top: 24,
            right: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  _navButton('Why Us', () => onNavItemTap('whyus')),
                  const SizedBox(width: 24),
                  _navButton('Curriculum', () => onNavItemTap('curriculum')),
                  const SizedBox(width: 24),
                  _navButton(
                      'Testimonials', () => onNavItemTap('testimonials')),
                  const SizedBox(width: 24),
                  _navButton('Contact Us', () => onNavItemTap('contact')),
                ],
              ),
            ),
          ),
          // Logo
          Positioned(
            top: 24,
            left: 24,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(
                'assets/images/ct_logo.png',
                height: 70,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.fromLTRB(120, 160, 120, 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFF001668), Color(0xFF2196F3)],
                  ).createShader(bounds),
                  child: SelectableText.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: "プログラミングで",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        const TextSpan(
                          text: "\n",
                        ),
                        TextSpan(
                          text: "世界",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 120,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4,
                          ),
                        ),
                        const TextSpan(
                          text: "をデザインしよう",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF001668),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF001668).withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Text(
                    "ワーホリ後のキャリアをプログラミングで切り開く",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
          color: Color(0xFF001668),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

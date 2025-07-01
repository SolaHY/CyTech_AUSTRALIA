import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    const double cardHeight = 260; // カードの高さに合わせて
    final ScrollController scrollController = ScrollController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Learner Testimonials',
          style: GoogleFonts.inter(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1A237E),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '学習者の声を使ってみましょう。',
          style: GoogleFonts.inter(fontSize: 18, color: Colors.black87),
        ),
        const SizedBox(height: 32),
        SizedBox(
          height: cardHeight,
          child: Scrollbar(
            controller: scrollController,
            thumbVisibility: true,
            child: SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 24),
                  _TestimonialCard(
                    imageAsset: 'assets/images/3.png',
                    url: 'https://example.com/1',
                  ),
                  const SizedBox(width: 24),
                  _TestimonialCard(
                    imageAsset: 'assets/images/6.png',
                    url: 'https://example.com/2',
                  ),
                  const SizedBox(width: 24),
                  _TestimonialCard(
                    imageAsset: 'assets/images/8.png',
                    url: 'https://example.com/3',
                  ),
                  const SizedBox(width: 24),
                  _TestimonialCard(
                    imageAsset: 'assets/images/10.png',
                    url: 'https://example.com/3',
                  ),
                  const SizedBox(width: 24),
                ],
              ),
            ),
          ),
        ),
        // Container(
        //   margin: const EdgeInsets.only(top: 8),
        //   height: 6,
        //   width: double.infinity,
        //   decoration: BoxDecoration(
        //     color: Colors.black12,
        //     borderRadius: BorderRadius.circular(3),
        //   ),
        // ),
      ],
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  final String imageAsset;
  final String url;

  const _TestimonialCard({required this.imageAsset, required this.url});

  void _launchURL() async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchURL,
      child: Container(
        width: 450,
        height: 260,
        decoration: BoxDecoration(
          color: const Color(0xFFF8F9FB),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            imageAsset,
            fit: BoxFit.cover,
            width: 260,
            height: 320,
          ),
        ),
      ),
    );
  }
}

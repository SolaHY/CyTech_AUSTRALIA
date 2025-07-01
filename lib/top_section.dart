import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 520, // Fixed height for hero area
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(250, 245, 125, 51),
            Color.fromARGB(250, 251, 63, 169),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // World map overlay with opacity
          Positioned.fill(
            child: Opacity(
              opacity: 1,
              child: Image.asset(
                'assets/images/worldmap-full.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 18,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/ct_logo_w.png', height: 36),
                        const SizedBox(width: 12),
                      ],
                    ),
                    Row(
                      children: [
                        _NavLink('Why CyTech'),
                        _NavLink('Curriculum'),
                        _NavLink('Testimonials'),
                        _NavLink('Contact us'),
                      ],
                    ),
                  ],
                ),
              ),
              // Expanded hero content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 175),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 32),
                      Text(
                        'プログラミングで',
                        style: GoogleFonts.notoSansJp(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _HeadlineWithOutline(
                        alignment: AlignmentDirectional.centerStart,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Design the world with Programming.',
                        style: GoogleFonts.lato(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 32),
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFC466B), Color(0xFFFF6FCB)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(32),
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              child: Text(
                                'ワーホリ後のキャリアをプログラミングで切り開く',
                                style: GoogleFonts.notoSansJp(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String text;
  const _NavLink(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        style: GoogleFonts.inter(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

class _HeadlineWithOutline extends StatelessWidget {
  final AlignmentGeometry alignment;
  const _HeadlineWithOutline({this.alignment = AlignmentDirectional.center});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Outlined "世界"
          Stack(
            children: [
              // Outline
              Text(
                '世界',
                style: GoogleFonts.notoSansJp(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 4
                    ..color = Colors.white,
                ),
              ),
              // Fill
              Text(
                '世界',
                style: GoogleFonts.notoSansJp(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  color: Colors.transparent,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 0),
                      blurRadius: 0,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          Text(
            'をデザインしよう。',
            style: GoogleFonts.notoSansJp(
              fontSize: 56,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

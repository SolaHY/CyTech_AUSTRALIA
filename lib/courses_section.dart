import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesSection extends StatelessWidget {
  const CoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_CourseHexData> hexes = [
      _CourseHexData(
        gradient: const LinearGradient(
          colors: [Color(0xFFF857A6), Color(0xFFFF5858)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        title: 'HTML/CSS',
        description: 'データベースの操作と\n効率的なデータ管理。',
      ),
      _CourseHexData(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFB75E), Color(0xFFED8F03)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        title: 'JavaScript',
        description: 'データベースの操作と\n効率的なデータ管理。',
      ),
      _CourseHexData(
        gradient: const LinearGradient(
          colors: [Color(0xFF43E97B), Color(0xFF38F9D7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        title: 'PHP',
        description: 'データベースの操作と\n効率的なデータ管理。',
      ),
      _CourseHexData(
        gradient: const LinearGradient(
          colors: [Color(0xFF17EAD9), Color(0xFF6078EA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        title: 'SQL',
        description: 'データベースの操作と\n効率的なデータ管理。',
      ),
      _CourseHexData(
        gradient: const LinearGradient(
          colors: [Color(0xFF622774), Color(0xFFC53364)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        title: 'Java',
        description: 'データベースの操作と\n効率的なデータ管理。',
      ),
    ];
    return Container(
      width: double.infinity,
      color: const Color(0xFFF8F9FB),
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ロゴ＋Learn CyTech
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/ct_logo.png', height: 48),
              const SizedBox(width: 12),
              Text(
                'Learn',
                style: GoogleFonts.lato(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1A237E),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'CyTech',
                style: GoogleFonts.lato(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1A237E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'CyTech で学べること',
            style: GoogleFonts.notoSansJp(
              fontSize: 20,
              color: const Color(0xFF1A237E),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 1段目（3つ、間隔なし）
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _HexCard(data: hexes[0]),
                    const SizedBox(width: 150),
                    _HexCard(data: hexes[1]),
                    const SizedBox(width: 150),
                    _HexCard(data: hexes[2]),
                  ],
                ),
                // 2段目（1段目の縦中央に配置）
                Transform.translate(
                  offset: const Offset(0, -165),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _HexCard(data: hexes[3]), // 青
                      const SizedBox(width: 150),
                      _HexCard(data: hexes[4]), // 紫
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CourseHexData {
  final LinearGradient gradient;
  final String title;
  final String description;
  const _CourseHexData({
    required this.gradient,
    required this.title,
    required this.description,
  });
}

class _HexCard extends StatelessWidget {
  final _CourseHexData data;
  const _HexCard({required this.data});
  static const double boxWidth = 260;
  static const double boxHeight = 280;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: boxWidth,
      height: boxHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(boxWidth, boxHeight),
            painter: _HexPainter(data.gradient),
          ),
          // 白い丸
          Positioned(
            top: boxHeight * 0.15,
            left: (boxWidth - 40) / 2,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
          // テキスト
          Positioned(
            top: boxHeight * 0.32,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  data.title,
                  style: GoogleFonts.lato(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  data.description,
                  style: GoogleFonts.notoSansJp(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HexPainter extends CustomPainter {
  final LinearGradient gradient;
  _HexPainter(this.gradient);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );
    final path = Path();
    final w = size.width;
    final h = size.height;
    // 横線がトップになるように六角形を描画
    final double r = w / 2;
    final double centerX = w / 2;
    final double centerY = h / 2;
    for (int i = 0; i < 6; i++) {
      final angle = (i * 60) * 3.1415926535 / 180;
      final x = centerX + r * Math.cos(angle);
      final y = centerY + r * Math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

class CoursesSection extends StatelessWidget {
  const CoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> courses = [
      {
        "title": "HTML & CSS",
        "description": "Webページの基礎をマスター。",
        "icon": FontAwesomeIcons.html5,
        "color": Colors.blueAccent,
        "details": {
          "duration": "2ヶ月",
          "topics": [
            "HTML5の基本構造",
            "CSS3によるスタイリング",
            "FlexboxとGrid",
            "アニメーション効果"
          ],
        }
      },
      {
        "title": "JavaScript",
        "description": "Webプロジェクトに動的な機能性を追加。",
        "icon": FontAwesomeIcons.js,
        "color": Color(0xFFF7DF1E),
        "details": {
          "duration": "3ヶ月",
          "topics": [
            "JavaScriptの基本構文",
            "DOM操作",
            "非同期処理",
          ],
        }
      },
      {
        "title": "Java",
        "description": "Javaを使用してWebアプリを構築。",
        "icon": FontAwesomeIcons.java,
        "color": Colors.purpleAccent,
        "details": {
          "duration": "4ヶ月",
          "topics": [
            "Javaの基本構文",
            "オブジェクト指向プログラミング",
            "Spring Framework",
            "データベース連携",
          ],
        }
      },
      {
        "title": "PHP",
        "description": "PHPを使用してWebアプリを構築。",
        "icon": FontAwesomeIcons.php,
        "color": Color(0xFF777BB4),
        "details": {
          "duration": "3ヶ月",
          "topics": [
            "PHPの基本構文",
            "Laravelフレームワーク",
            "データベース設計",
            "API開発",
          ],
        }
      },
      {
        "title": "SQL",
        "description": "SQLを使ってデータベースの操作と効率的なデータ管理。",
        "icon": FontAwesomeIcons.database,
        "color": Colors.orangeAccent,
        "details": {
          "duration": "1ヶ月",
          "topics": ["SQLの基本構文", "テーブル設計", "インデックス設計"],
        }
      },
    ];

    return Container(
      padding: const EdgeInsets.fromLTRB(120, 80, 120, 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // タイトル
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF001668), Color(0xFF2196F3)],
            ).createShader(bounds),
            child: const Text(
              "Learn with CyTech",
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
          // 中央ロゴと円形コース配置
          Center(
            child: SizedBox(
              height: 700,
              width: 700,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Connecting Line
                  CustomPaint(
                    size: const Size(700, 700),
                    painter: CircleConnectorPainter(
                      radius: 250.0,
                      color: Colors.grey.withOpacity(0.3),
                      strokeWidth: 8.0,
                    ),
                  ),
                  // 中央ロゴ
                  Image.asset(
                    'assets/images/ct_logo_only.png',
                    width: 150,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                  // 円形配置された各コース
                  ...List.generate(courses.length, (index) {
                    final angle = (2 * pi * index / courses.length) - (pi / 2);
                    const radius = 250.0;
                    const cardSize = 160.0;

                    final x = radius * cos(angle);
                    final y = radius * sin(angle);

                    return Positioned(
                      left: 350 + x - cardSize / 2,
                      top: 350 + y - cardSize / 2,
                      child: _buildCircularCourseCard(
                        context: context,
                        course: courses[index],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 円形デザインのカード
  Widget _buildCircularCourseCard({
    required BuildContext context,
    required Map<String, dynamic> course,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _showCourseDetails(context, course),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: course["color"],
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
              )
            ],
          ),
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                course["icon"],
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(height: 10),
              Text(
                course["title"],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Text(
                course["description"],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCourseDetails(BuildContext context, Map<String, dynamic> course) {
    // Prevent multiple dialogs from opening
    if (ModalRoute.of(context)?.isCurrent != true) {
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Stack(
        children: [
          Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: 600,
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: course["color"].withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          course["icon"],
                          color: course["color"],
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course["title"],
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: course["color"],
                              ),
                            ),
                            Text(
                              "期間: ${course["details"]["duration"]}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "学習内容",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...course["details"]["topics"].map<Widget>((topic) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: course["color"],
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                topic,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class CircleConnectorPainter extends CustomPainter {
  final double radius;
  final Color color;
  final double strokeWidth;

  CircleConnectorPainter({
    required this.radius,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CircleConnectorPainter oldDelegate) {
    return oldDelegate.radius != radius ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}

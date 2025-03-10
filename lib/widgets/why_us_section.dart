import 'package:flutter/material.dart';
import 'dart:math' as math;

class WhyUsSection extends StatefulWidget {
  const WhyUsSection({super.key});

  @override
  State<WhyUsSection> createState() => _WhyUsSectionState();
}

class _WhyUsSectionState extends State<WhyUsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Map<String, dynamic>> reasons = [
    {
      "number": "01",
      "title": "目標設定",
      "description":
          "学習を始める際に、まずはいつまでに学習を終わらせるか自身の目標設定をしていただきます。\n長期的な目標だけではなく、中長期の目標を設定して始めていきます。\nそうすることで、達成度を定期的に振り返ってより精度の高いスケジュールで進めていくことができます。",
      "icon": Icons.track_changes,
    },
    {
      "number": "02",
      "title": "実践的なカリキュラム",
      "description":
          "学習修了後に即戦力となる人材になれるようなカリキュラム内容になっております。\nもちろん簡単ではありません。簡単でないことには理由があります。\n学習終了後には現場経験２年レベルの力を身につけます。",
      "icon": Icons.school,
    },
    {
      "number": "03",
      "title": "手厚いサポート",
      "description":
          "CyTechではAIを用いたチャットでよりスピーディに問題解決を行うことができます。\nもちろんAIとのチャットで解決できなかった場合は経験豊富なインストラクターがチャットや画面共有などを用いてサポート致します。\n",
      "icon": Icons.support_agent,
    },
    {
      "number": "04",
      "title": "英語も学べる",
      "description":
          "実はCyTechはエンジニアだけではなく、英語についても学べるカリキュラムを用意しています。\nエンジニア学習修了後、ワーキングホリデーで培った英語力をブラッシュアップしていくこともできます。",
      "icon": Icons.language,
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(120, 80, 120, 80),
      child: Column(
        children: [
          // Animated Title Section
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF001668), Color(0xFF2196F3)],
            ).createShader(bounds),
            child: const Text(
              "Why CyTech",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "CyTechが選ばれる理由",
            style: TextStyle(
              fontSize: 24,
              color: Colors.black54.withOpacity(0.8),
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 32),
          // Reasons Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
            ),
            itemCount: reasons.length,
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return _buildReasonCard(
                    reasons[index],
                    _controller.value,
                    index,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildReasonCard(
      Map<String, dynamic> reason, double animation, int index) {
    final hoverTransform = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateY(math.pi * animation * (index % 2 == 0 ? 0.02 : -0.02));

    return MouseRegion(
      onEnter: (_) => setState(() {}),
      onExit: (_) => setState(() {}),
      child: Transform(
        transform: hoverTransform,
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF001668).withOpacity(0.9),
                const Color(0xFF001668).withOpacity(0.7),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF001668).withOpacity(0.2),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                // Background Pattern
                Positioned(
                  right: -20,
                  bottom: -20,
                  child: Icon(
                    reason['icon'],
                    size: 120,
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
                // Content
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              reason['icon'],
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            reason['number'],
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        reason['title'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        reason['description'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

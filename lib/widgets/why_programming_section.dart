import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class WhyProgrammingSection extends StatefulWidget {
  const WhyProgrammingSection({super.key});

  @override
  State<WhyProgrammingSection> createState() => _WhyProgrammingSectionState();
}

class _WhyProgrammingSectionState extends State<WhyProgrammingSection>
    with TickerProviderStateMixin {
  late AnimationController _titleController;
  late Animation<double> _titleAnimation;
  late Animation<double> _subtitleAnimation;
  final List<AnimationController> _cardControllers = [];
  final List<Animation<double>> _cardAnimations = [];
  bool _hasAnimatedTitle = false;

  final List<Map<String, dynamic>> benefits = [
    {
      "title": "自由な働き方ができる",
      "description":
          "エンジニアになれば、世界中どこでも働けるスキルが手に入る。ワーホリのように自由に旅をしながら、リモートワークで収入を得ることも可能！",
      "icon": Icons.travel_explore,
      "color": Color(0xFF4CAF50),
      "slideFrom": "left",
    },
    {
      "title": "英語 × IT でキャリアの可能性が広がる",
      "description":
          "ワーホリで学んだ英語力とエンジニアスキルを組み合わせれば、グローバルな仕事ができる。外資系企業や海外就職も夢じゃない！",
      "icon": Icons.language,
      "color": Color(0xFF2196F3),
      "slideFrom": "right",
    },
    {
      "title": "未経験からでもOK",
      "description": "プログラミングは未経験からでも学べる。短期間でスキルを身につけ、数ヶ月後にはエンジニアとして仕事をする人も多い！",
      "icon": Icons.rocket_launch,
      "color": Color(0xFFF44336),
      "slideFrom": "left",
    },
    {
      "title": "ワーホリ後の不安を解消できる",
      "description": "エンジニアなら、安定した収入とキャリアを手に入れながら、新しい挑戦も続けられる！",
      "icon": Icons.psychology,
      "color": Color(0xFF9C27B0),
      "slideFrom": "right",
    },
    {
      "title": "手に職をつけてどこでも働ける",
      "description": "エンジニアスキルがあれば、フリーランスも企業就職も選べる。自分のライフスタイルに合った働き方を見つけられる！",
      "icon": Icons.laptop_mac,
      "color": Color(0xFFFF9800),
      "slideFrom": "left",
    },
  ];

  @override
  void initState() {
    super.initState();
    _titleController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _titleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _titleController,
        curve: const Interval(0.0, 0.2, curve: Curves.easeOutCubic),
      ),
    );

    _subtitleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _titleController,
        curve: const Interval(0.1, 0.3, curve: Curves.easeOutCubic),
      ),
    );

    // Initialize controllers and animations for each card
    for (int i = 0; i < benefits.length; i++) {
      final controller = AnimationController(
        duration: const Duration(milliseconds: 1500),
        vsync: this,
      );
      _cardControllers.add(controller);

      final animation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeOutCubic,
        ),
      );
      _cardAnimations.add(animation);
    }
  }

  void _handleTitleVisibilityChanged(VisibilityInfo info) {
    if (!_hasAnimatedTitle && info.visibleFraction > 0.5) {
      _hasAnimatedTitle = true;
      _titleController.forward();
    }
  }

  void _handleCardVisibilityChanged(int index, VisibilityInfo info) {
    if (info.visibleFraction > 0.3) {
      _cardControllers[index].forward();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    for (var controller in _cardControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(120, 80, 120, 80),
      child: Column(
        children: [
          // Title Section with Visibility Detector
          VisibilityDetector(
            key: const Key('title_section'),
            onVisibilityChanged: _handleTitleVisibilityChanged,
            child: Column(
              children: [
                // Animated Title
                FadeTransition(
                  opacity: _titleAnimation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, -0.5),
                      end: Offset.zero,
                    ).animate(_titleAnimation),
                    child: ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Color(0xFF001668), Color(0xFF2196F3)],
                      ).createShader(bounds),
                      child: const Text(
                        "Why Programming",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Animated Subtitle
                FadeTransition(
                  opacity: _subtitleAnimation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, -0.3),
                      end: Offset.zero,
                    ).animate(_subtitleAnimation),
                    child: Text(
                      "プログラミングを学ぶ5つの理由",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black54.withOpacity(0.8),
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 48),
          // Animated Cards with individual Visibility Detectors
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: benefits.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: VisibilityDetector(
                key: Key('benefit_card_$index'),
                onVisibilityChanged: (info) =>
                    _handleCardVisibilityChanged(index, info),
                child: FadeTransition(
                  opacity: _cardAnimations[index],
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(
                        benefits[index]['slideFrom'] == 'left' ? -0.5 : 0.5,
                        0,
                      ),
                      end: Offset.zero,
                    ).animate(_cardAnimations[index]),
                    child: _buildBenefitCard(benefits[index], index),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitCard(Map<String, dynamic> benefit, int index) {
    return MouseRegion(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: benefit['color'].withOpacity(0.2),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Background Pattern
              Positioned(
                right: -40,
                top: -40,
                child: Icon(
                  benefit['icon'],
                  size: 160,
                  color: benefit['color'].withOpacity(0.1),
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon Column
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: benefit['color'].withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        benefit['icon'],
                        color: benefit['color'],
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 24),
                    // Text Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            benefit['title'],
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: benefit['color'],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            benefit['description'],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

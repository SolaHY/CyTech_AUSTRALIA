import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CatchSection extends StatefulWidget {
  const CatchSection({super.key});

  @override
  State<CatchSection> createState() => _CatchSectionState();
}

class _CatchSectionState extends State<CatchSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _titleAnimation;
  late Animation<double> _subtitleAnimation;
  late Animation<double> _listAnimation;
  late Animation<double> _solutionAnimation;
  late Animation<double> _buttonAnimation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _titleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
      ),
    );

    _subtitleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.5, curve: Curves.easeOut),
      ),
    );

    _listAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.7, curve: Curves.easeOut),
      ),
    );

    _solutionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 0.9, curve: Curves.easeOut),
      ),
    );

    _buttonAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.8, 1.0, curve: Curves.easeOut),
      ),
    );
  }

  void _handleVisibilityChanged(VisibilityInfo info) {
    if (!_hasAnimated && info.visibleFraction > 0.5) {
      _hasAnimated = true;
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('catch_section'),
      onVisibilityChanged: _handleVisibilityChanged,
      child: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Animated Title Section
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
                    "After Your Working Holiday",
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
            FadeTransition(
              opacity: _subtitleAnimation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, -0.3),
                  end: Offset.zero,
                ).animate(_subtitleAnimation),
                child: Text(
                  "ワーホリが終わった後、こんな悩みを抱えていませんか？",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black54.withOpacity(0.8),
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Animated List
            FadeTransition(
              opacity: _listAnimation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-0.3, 0),
                  end: Offset.zero,
                ).animate(_listAnimation),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading:
                          Icon(Icons.help_outline, color: Color(0xFF001668)),
                      title: SelectableText(
                        "何をしたら良いいんだろう。。",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    ListTile(
                      leading:
                          Icon(Icons.help_outline, color: Color(0xFF001668)),
                      title: SelectableText(
                        "帰国後のキャリアが決められない。。",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    ListTile(
                      leading:
                          Icon(Icons.help_outline, color: Color(0xFF001668)),
                      title: SelectableText(
                        "新しいスキルを身につけたいけど何から始めればいいの？",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Animated Solution Box
            FadeTransition(
              opacity: _solutionAnimation,
              child: ScaleTransition(
                scale: _solutionAnimation,
                child: Container(
                  padding: const EdgeInsets.all(16),
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
                  child: const Column(
                    children: [
                      SelectableText(
                        "CyTechなら10ヶ月で次のステップへ！",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF001668),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      SelectableText(
                        "スキルを身につけて新しいキャリアをスタートしませんか？\n未経験からでも安心して学べます。\nこの他、設計技術やテストについても学んでいきます！",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Animated Button
            FadeTransition(
              opacity: _buttonAnimation,
              child: ScaleTransition(
                scale: _buttonAnimation,
                child: ElevatedButton(
                  onPressed: () async {
                    final url = Uri.parse("https://cytech.online/");
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("URLを開くことができません")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    backgroundColor: const Color(0xFF001668),
                    elevation: 5,
                    shadowColor: Colors.black.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ).copyWith(
                    elevation: WidgetStateProperty.resolveWith<double>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.hovered)) {
                          return 40;
                        }
                        return 5;
                      },
                    ),
                    backgroundColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.hovered)) {
                          return const Color(0xFF0047E6);
                        }
                        return const Color(0xFF001668);
                      },
                    ),
                    foregroundColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.hovered)) {
                          return Colors.white.withOpacity(0.8);
                        }
                        return Colors.white;
                      },
                    ),
                    shadowColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.hovered)) {
                          return Colors.black.withOpacity(0.5);
                        }
                        return Colors.black.withOpacity(0.3);
                      },
                    ),
                  ),
                  child: const Text(
                    "詳細はこちら",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

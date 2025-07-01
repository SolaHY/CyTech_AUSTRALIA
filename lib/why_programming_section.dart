import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhyProgrammingSection extends StatelessWidget {
  const WhyProgrammingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_WhyReason> reasons = [
      _WhyReason(
        color: const Color(0xFFF06292),
        title: '自由な働き方ができる',
        description:
            'エンジニアになれば、世界中どこでも働けるスキルが手に入る。ワーホリのように自由に旅をしながら、リモートワークで収入を得ることも可能！',
        icon: Icons.travel_explore,
      ),
      _WhyReason(
        color: const Color(0xFFFFB74D),
        title: '将来性が高い',
        description: 'IT業界は今後も成長が期待されており、プログラマーの需要は高まっています。安定したキャリアを築けます。',
        icon: Icons.language,
      ),
      _WhyReason(
        color: const Color(0xFF81C784),
        title: '高収入を目指せる',
        description: '専門性の高いスキルを身につけることで、他業種と比べて高い収入を得ることができます。',
        icon: Icons.rocket_launch,
      ),
      _WhyReason(
        color: const Color(0xFF4FC3F7),
        title: '世界中で活躍できる',
        description: 'プログラミングは世界共通のスキル。海外でも仕事のチャンスが広がります。',
        icon: Icons.computer,
      ),
      _WhyReason(
        color: const Color(0xFFBA68C8),
        title: '論理的思考力が身につく',
        description: '課題解決力や論理的思考力が鍛えられ、他の分野でも役立つ力が身につきます。',
        icon: Icons.psychology,
      ),
    ];
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Why Programming',
            style: GoogleFonts.lato(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A237E),
              letterSpacing: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'プログラミングを学ぶ５つの理由',
            style: GoogleFonts.notoSansJp(
              fontSize: 18,
              color: const Color(0xFF616161),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Center(
            child: SizedBox(
              width: 600,
              child: Column(
                children: reasons
                    .map(
                      (r) => _WhyProgCard(
                        color: r.color,
                        title: r.title,
                        description: r.description,
                        icon: r.icon,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WhyReason {
  final Color color;
  final String title;
  final String description;
  final IconData icon;
  const _WhyReason({
    required this.color,
    required this.title,
    required this.description,
    required this.icon,
  });
}

class _WhyProgCard extends StatelessWidget {
  final Color color;
  final String title;
  final String description;
  final IconData icon;
  const _WhyProgCard({
    required this.color,
    required this.title,
    required this.description,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.25),
            blurRadius: 18,
            spreadRadius: 0,
            offset: const Offset(8, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.notoSansJp(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: GoogleFonts.notoSansJp(
                  fontSize: 15,
                  color: const Color(0xFF1A237E),
                ),
              ),
            ],
          ),
          Positioned(
            top: -20,
            right: -20,
            child: Opacity(
              opacity: 0.3,
              child: Icon(icon, color: color, size: 80),
            ),
          ),
        ],
      ),
    );
  }
}

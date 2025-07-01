import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhyCyTechSection extends StatelessWidget {
  const WhyCyTechSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_WhyCyTechCardData> cards = [
      _WhyCyTechCardData(
        title: '実践的なカリキュラム',
        description:
            '学習を始める際に、まずはいつまでに学習を終わらせるか自身の目標設定をしていただきます。\n長期的な目標だけではなく、中長期の目標を設定して始めていきます。そうすることで、進捗度を定期的に振り返ってより精度の高いスケジュールで進めていくことができます。',
      ),
      _WhyCyTechCardData(
        title: '実践的なカリキュラム',
        description:
            '学習を始める際に、まずはいつまでに学習を終わらせるか自身の目標設定をしていただきます。\n長期的な目標だけではなく、中長期の目標を設定して始めていきます。そうすることで、進捗度を定期的に振り返ってより精度の高いスケジュールで進めていくことができます。',
      ),
      _WhyCyTechCardData(
        title: '実践的なカリキュラム',
        description:
            '学習を始める際に、まずはいつまでに学習を終わらせるか自身の目標設定をしていただきます。\n長期的な目標だけではなく、中長期の目標を設定して始めていきます。そうすることで、進捗度を定期的に振り返ってより精度の高いスケジュールで進めていくことができます。',
      ),
      _WhyCyTechCardData(
        title: '実践的なカリキュラム',
        description:
            '学習を始める際に、まずはいつまでに学習を終わらせるか自身の目標設定をしていただきます。\n長期的な目標だけではなく、中長期の目標を設定して始めていきます。そうすることで、進捗度を定期的に振り返ってより精度の高いスケジュールで進めていくことができます。',
      ),
    ];
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 252, 140, 70),
            Color.fromARGB(255, 199, 62, 169),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ロゴ＋Why CyTech
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 12),
              Text(
                'Why',
                style: GoogleFonts.lato(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 10, 5, 103),
                ),
              ),
              const SizedBox(width: 8),
              Image.asset('assets/images/ct_logo.png', height: 48),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'CyTech が選ばれる理由',
            style: GoogleFonts.notoSansJp(
              fontSize: 20,
              color: const Color.fromARGB(255, 10, 5, 103),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Center(
            child: SizedBox(
              width: 880, // 400*2 + spacing(40)
              child: Wrap(
                spacing: 40,
                runSpacing: 32,
                alignment: WrapAlignment.center,
                children: List.generate(
                  cards.length,
                  (i) => _WhyCyTechCard(index: i + 1, data: cards[i]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WhyCyTechCardData {
  final String title;
  final String description;
  const _WhyCyTechCardData({required this.title, required this.description});
}

class _WhyCyTechCard extends StatelessWidget {
  final int index;
  final _WhyCyTechCardData data;
  const _WhyCyTechCard({required this.index, required this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 28),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                index.toString().padLeft(2, '0'),
                style: GoogleFonts.lato(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1A237E),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  data.title,
                  style: GoogleFonts.notoSansJp(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A237E),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(height: 2, width: 60, color: const Color(0xFF1A237E)),
          const SizedBox(height: 16),
          Text(
            data.description.replaceAll('\\n', '\n'),
            style: GoogleFonts.notoSansJp(
              fontSize: 16,
              color: const Color(0xFF1A237E),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AfterWorkingHolidaySection extends StatelessWidget {
  const AfterWorkingHolidaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 背景の斜めカット
        ClipPath(
          clipper: _DiagonalClipper(),
          child: Container(
            width: double.infinity,
            height: 400,
            color: Colors.white,
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'After Your Working Holiday',
                style: GoogleFonts.lato(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1A237E),
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'ワーホリが終わった後、こんな悩みを抱えていませんか？',
                style: GoogleFonts.notoSansJp(
                  fontSize: 18,
                  color: const Color(0xFF1A237E),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              _Question('何をしたら良いんだろう…'),
              _Question('帰国後のキャリアが決められない…'),
              _Question('新しいスキルを身につけたいけど何から始めればいいの？'),
            ],
          ),
        ),
      ],
    );
  }
}

class _Question extends StatelessWidget {
  final String text;
  const _Question(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(
        text,
        style: GoogleFonts.notoSansJp(
          fontSize: 20,
          color: const Color(0xFF1A237E),
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class CyTechStepSection extends StatelessWidget {
  const CyTechStepSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      padding: const EdgeInsets.only(top: 48, bottom: 88),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ロゴ＋テキスト
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/ct_logo.png', height: 48),
              const SizedBox(width: 8),
              const SizedBox(width: 8),
              Text(
                'なら 10 ヶ月で次のステップへ！',
                style: GoogleFonts.notoSansJp(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1A237E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'スキルを身につけて新しいキャリアをスタートしませんか？',
            style: GoogleFonts.notoSansJp(
              fontSize: 18,
              color: const Color(0xFF1A237E),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            '未経験からでも安心して学べます。',
            style: GoogleFonts.notoSansJp(
              fontSize: 18,
              color: const Color(0xFF1A237E),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'その他、設計技術やテストについても学んでいきます！',
            style: GoogleFonts.notoSansJp(
              fontSize: 18,
              color: const Color(0xFF1A237E),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          // 紫グラデーションボタン
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 161, 109, 245),
                  Color.fromARGB(255, 51, 78, 214),
                ],
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
                    horizontal: 48,
                    vertical: 16,
                  ),
                  child: Text(
                    '＼ 詳細はこちら ／',
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
    );
  }
}

// 背景の斜めカット用クリッパー
class _DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.55); // 両端
    path.lineTo(size.width / 2, size.height); // 中央の谷
    path.lineTo(size.width, size.height * 0.55); // 右端
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

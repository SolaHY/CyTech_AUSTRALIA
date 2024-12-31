import 'package:flutter/material.dart';
import 'package:CyTech_Austraia_Dev/styles.dart'; // styles.dart をインポート

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16), // 左右の余白
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center, // ロゴとテキストを中央で揃える
          children: [
            // ロゴ
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/images/ct_logo_w.png', // ロゴのパス
                height: 70, // ロゴの高さを調整
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 16), // ロゴとテキストの間のスペース
            // テキスト部分
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // テキストを縦中央に配置
                crossAxisAlignment: CrossAxisAlignment.start, // 左寄せ
                children: [
                  SelectableText(
                    "プログラミングで",
                    style: defaultTextStyle.copyWith(
                      color: const Color(0xFF001668),
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 8), // Smaller space between lines
                  SelectableText(
                    "世界をデザインしよう",
                    style: defaultTextStyle.copyWith(
                      color: const Color(0xFF001668),
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

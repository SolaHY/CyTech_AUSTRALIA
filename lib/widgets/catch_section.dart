import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CatchSection extends StatelessWidget {
  const CatchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // セクションタイトル
          const SelectableText(
            "What should I do after my working holiday?",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF001668),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          // 説明文
          const SelectableText(
            "ワーホリが終わった後、こんな悩みを抱えていませんか？",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          // 悩みのリスト
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(Icons.help_outline, color: Color(0xFF001668)),
                title: SelectableText(
                  "何をしたら良いいんだろう。。",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                leading: Icon(Icons.help_outline, color: Color(0xFF001668)),
                title: SelectableText(
                  "帰国後のキャリアが決められない。。",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                leading: Icon(Icons.help_outline, color: Color(0xFF001668)),
                title: SelectableText(
                  "新しいスキルを身につけたいけど何から始めればいいの？",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          // 解決策
          Container(
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
                  "スキルを身につけて新しいキャリアをスタートしませんか？\n未経験からでも安心して学べます。",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () async {
              final url = Uri.parse("https://cytech.online/"); // 開きたいURL
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("URLを開くことができません")),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              backgroundColor: const Color(0xFF001668),
            ),
            child: const Text(
              "詳細はこちら",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

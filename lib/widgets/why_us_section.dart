import 'package:flutter/material.dart';
import 'package:CyTech_Austraia_Dev/styles.dart';

class WhyUsSection extends StatelessWidget {
  const WhyUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> reasons = [
      {
        "number": "01",
        "title": "目標設定",
        "description":
            "学習を始める際に、いつまでに学習を終わらせるか自身の目標設定をしていただきます。学習報告も定期的に必要ですので、進捗管理も確実に行うことができます。",
      },
      {
        "number": "02",
        "title": "実践的なカリキュラム",
        "description":
            "学習修了後に即戦力となる人材になれるようなカリキュラム内容になっております。時間をかけるだけでは意味がありません。どれだけ力が付いているか、実務に近い内容を学習することで体感します。",
      },
      {
        "number": "03",
        "title": "手厚いサポート",
        "description":
            "今や1on1サポートは当たり前。AIを用いたチャットでよりスピーディに問題解決を行うことができます。また、学習修了後は専属キャリアカウンセラーが転職をサポート致します。",
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Title
          const SelectableText(
            "Why Choose Our System?",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF001668),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          // Section Title
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SelectableText(
              "コース終了後、即戦力となることにフォーカスしてます。",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          // Reasons Cards (Vertical)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: reasons.map((reason) {
              return Padding(
                padding:
                    const EdgeInsets.only(bottom: 20), // Space between cards
                child: _buildReasonCard(
                  number: reason["number"],
                  title: reason["title"],
                  description: reason["description"],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // Helper Function to Build Each Reason Card
  Widget _buildReasonCard({
    required String number,
    required String title,
    required String description,
  }) {
    return Container(
      width: double.infinity, // Full width of the parent
      padding: const EdgeInsets.all(20),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Number inside a circle
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xFF001668), // Background color
              shape: BoxShape.circle, // Circle shape
            ),
            alignment: Alignment.center,
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white, // White text color
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 16), // Spacing between circle and text content
          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF001668),
                  ),
                  textAlign: TextAlign.left, // Left-aligned text
                ),
                const SizedBox(height: 8),
                // Description
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF001668),
                  ),
                  textAlign: TextAlign.left, // Left-aligned text
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

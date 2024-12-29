import 'package:flutter/material.dart';
import 'package:CyTech_Austraia_Dev/styles.dart';

class ContactFormWidget extends StatelessWidget {
  const ContactFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16), // Adds bottom padding
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ContactForm(), // ContactForm をポップアップとして表示
              );
            },
          );
        },
        style: buttonStyle,
        child: const Text("Contact Form"), // ContactFormを表示させるボタン
      ),
    );
  }
}

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min, // コンテンツの高さに合わせる
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Contact Us",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const TextField(
            decoration: InputDecoration(labelText: "Your Name"), //名前
          ),
          const SizedBox(height: 8),
          const TextField(
            decoration: InputDecoration(labelText: "Your Email"), //メールアドレス
          ),
          const SizedBox(height: 8),
          const TextField(
            decoration: InputDecoration(labelText: "Your Message"), //問い合わせ内容
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // ダイアログを閉じる
            },
            style: buttonStyle,
            child: const Text("Send Message"), // 送信ボタン
          ),
        ],
      ),
    );
  }
}

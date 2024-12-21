import 'package:flutter/material.dart';
import '../widgets/header_section.dart';
import '../widgets/about_section.dart';
import '../widgets/courses_section.dart';
import '../widgets/testimonials_section.dart';
import '../widgets/contact_form.dart';
import '../widgets/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/main_bg.jpeg'),
            fit: BoxFit.cover, // 背景画像を画面全体にカバー
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height, // 画面全体の高さを確保
            ),
            child: Column(
              children: [
                HeaderSection(),
                AboutSection(),
                CoursesSection(),
                TestimonialsSection(),
                ContactFormWidget(),
                Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

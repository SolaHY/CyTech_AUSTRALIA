import 'package:flutter/material.dart';
import '../widgets/header_section.dart';
import '../widgets/catch_section.dart';
import '../widgets/why_us_section.dart';
import '../widgets/courses_section.dart';
import '../widgets/testimonials_section.dart';
import '../widgets/contact_form.dart';
import '../widgets/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background image with gradient overlay on the left side
          Positioned.fill(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 255, 255, 255), // Pure white
                          Color.fromARGB(255, 144, 212, 244),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth / 3, // Adjust width for 1/3 or 1/4
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/main_bg.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Foreground content
          SingleChildScrollView(
            child: Column(
              children: [
                HeaderSection(),
                _divider(),
                CatchSection(),
                _divider(),
                WhyUsSection(),
                _divider(),
                CoursesSection(),
                _divider(),
                TestimonialsSection(),
                _divider(),
                ContactFormWidget(),
                Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Divider with decorative styling
  Widget _divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Divider(
        thickness: 2,
        color: Colors.grey[300],
        indent: 50,
        endIndent: 50,
      ),
    );
  }
}

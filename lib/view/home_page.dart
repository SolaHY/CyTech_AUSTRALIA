import 'package:flutter/material.dart';
import '../widgets/header_section.dart';
import '../widgets/catch_section.dart';
import '../widgets/why_us_section.dart';
import '../widgets/why_programming_section.dart';
import '../widgets/courses_section.dart';
import '../widgets/testimonials_section.dart';
import '../widgets/contact_form.dart';
import '../widgets/footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  void scrollToSection(String sectionId) {
    final context = sectionsKey[sectionId]?.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  final Map<String, GlobalKey> sectionsKey = {
    'whyus': GlobalKey(),
    'whyprogramming': GlobalKey(),
    'curriculum': GlobalKey(),
    'testimonials': GlobalKey(),
    'contact': GlobalKey(),
  };

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Foreground content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                _sectionWithBackground(
                  color: Colors.white,
                  child: HeaderSection(onNavItemTap: scrollToSection),
                ),
                _sectionWithBackground(
                  color: Colors.green[50]!,
                  child: const CatchSection(),
                ),
                _sectionWithBackground(
                  key: sectionsKey['whyprogramming'],
                  color: Colors.white,
                  child: const WhyProgrammingSection(),
                ),
                _sectionWithBackground(
                  key: sectionsKey['whyus'],
                  color: Colors.yellow[50]!,
                  child: const WhyUsSection(),
                ),
                _sectionWithBackground(
                  key: sectionsKey['curriculum'],
                  color: Colors.white,
                  child: const CoursesSection(),
                ),
                _sectionWithBackground(
                  key: sectionsKey['testimonials'],
                  color: Colors.purple[50]!,
                  child: const TestimonialsSection(),
                ),
                _sectionWithBackground(
                  key: sectionsKey['contact'],
                  color: Colors.white,
                  child: const ContactFormWidget(),
                ),
                _sectionWithBackground(
                  color: const Color(0xFF001668),
                  child: const Footer(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Section wrapper with background color
  Widget _sectionWithBackground(
      {Key? key, required Color color, required Widget child}) {
    // Define gradient colors based on the input color
    List<Color> gradientColors;
    if (color == Colors.white) {
      gradientColors = [Colors.white, Colors.white.withOpacity(0.95)];
    } else if (color == const Color(0xFF001668)) { // Footer color
      gradientColors = [
        const Color(0xFF001668),
        const Color(0xFF003399),
        const Color(0xFF0044CC),
      ];
    } else if (color == Colors.green[50]!) { // Catch section
      gradientColors = [
        Colors.green[50]!,
        Colors.orange[100]!,
        Colors.orange[200]!,
      ];
    } else if (color == Colors.yellow[50]!) { // Why Us section
      gradientColors = [
        Colors.yellow[50]!,
        Colors.pink[100]!,
        Colors.pink[200]!,
      ];
    } else if (color == Colors.purple[50]!) { // Courses section
      gradientColors = [
        Colors.purple[50]!,
        Colors.blue[100]!,
        Colors.blue[200]!,
      ];
    } else if (color == const Color(0xFFF8F9FA)) { // Contact section
      gradientColors = [
        const Color(0xFFF8F9FA),
        Colors.teal[100]!,
        Colors.teal[200]!,
      ];
    } else {
      gradientColors = [color, color.withOpacity(0.8)];
    }

    return Container(
      key: key,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
      ),
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: child,
          ),
        ),
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

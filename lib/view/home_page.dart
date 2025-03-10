import 'package:flutter/material.dart';
import '../widgets/header_section.dart';
import '../widgets/catch_section.dart';
import '../widgets/why_us_section.dart';
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  _sectionWithBackground(
                    color: Colors.white,
                    child: HeaderSection(onNavItemTap: scrollToSection),
                  ),
                  // _divider(),
                  _sectionWithBackground(
                    color: Colors.green[50]!,
                    child: const CatchSection(),
                  ),
                  // _divider(),
                  _sectionWithBackground(
                    key: sectionsKey['whyus'],
                    color: Colors.white,
                    child: const WhyUsSection(),
                  ),
                  // _divider(),
                  _sectionWithBackground(
                    key: sectionsKey['curriculum'],
                    color: Colors.purple[50]!,
                    child: const CoursesSection(),
                  ),
                  // _divider(),
                  _sectionWithBackground(
                    key: sectionsKey['testimonials'],
                    color: Colors.white,
                    child: const TestimonialsSection(),
                  ),
                  // _divider(),
                  _sectionWithBackground(
                    key: sectionsKey['contact'],
                    color: Colors.red[50]!,
                    child: const ContactFormWidget(),
                  ),
                  // _divider(),
                  _sectionWithBackground(
                    color: Colors.white,
                    child: const Footer(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Section wrapper with background color
  Widget _sectionWithBackground(
      {Key? key, required Color color, required Widget child}) {
    return Container(
      key: key,
      color: color,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: child,
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

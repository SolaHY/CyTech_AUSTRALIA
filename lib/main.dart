import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'after_working_holiday_and_step_section.dart';
import 'contact_form.dart';
import 'courses_section.dart';
import 'footer.dart';
import 'testimonials_section.dart';
import 'top_section.dart';
import 'why_cytech_section.dart';
import 'why_programming_section.dart';

void main() => runApp(const CyTechLandingApp());

class CyTechLandingApp extends StatelessWidget {
  const CyTechLandingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CyTech Landing',
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
        primaryColor: const Color(0xFF6A1B9A),
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            TopSection(),
            AfterWorkingHolidaySection(),
            CyTechStepSection(),
            WhyProgrammingSection(),
            WhyCyTechSection(),
            CoursesSection(),
            TestimonialsSection(),
            ContactForm(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

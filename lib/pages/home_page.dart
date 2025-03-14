import 'package:flutter/material.dart';
import '../widgets/contact_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CyTech Australia'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              height: 500,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF001668), Color(0xFF2196F3)],
                ),
              ),
              child: const Center(
                child: Text(
                  'Welcome to CyTech Australia',
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Contact Form Section
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: ContactFormWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

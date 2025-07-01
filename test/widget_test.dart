// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cytech_australia/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CyTech landing page smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CyTechLandingApp());

    // Verify that the app title is displayed
    expect(find.text('CyTech'), findsOneWidget);

    // Verify that the hero section title is displayed
    expect(find.text('Transform Your Learning Experience'), findsOneWidget);

    // Verify that the features section title is displayed
    expect(find.text('Why Choose CyTech?'), findsOneWidget);

    // Verify that the about section title is displayed
    expect(find.text('About CyTech'), findsOneWidget);

    // Verify that the contact section title is displayed
    expect(find.text('Ready to Get Started?'), findsOneWidget);
  });
}

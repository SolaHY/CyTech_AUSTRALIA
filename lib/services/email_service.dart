import 'dart:convert';
import 'package:http/http.dart' as http;

class EmailService {
  static const String _apiUrl =
      'YOUR_FIREBASE_FUNCTION_URL'; // You'll need to replace this with your actual Firebase Function URL

  static Future<bool> sendEmail({
    required String name,
    required String email,
    required String message,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': name,
          'email': email,
          'message': message,
          'to': 'o.akahoshi@thenewgate.co.jp',
          'subject': 'Contact Form Submission from $name',
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Error sending email: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Exception while sending email: $e');
      return false;
    }
  }
}

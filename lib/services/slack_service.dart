import 'dart:convert';
import 'package:http/http.dart' as http;

class SlackService {
  static const String _functionUrl =
      'https://sendcontactform-s4oidhal5a-as.a.run.app';

  Future<bool> sendNotification({
    required String name,
    required String email,
    required String message,
  }) async {
    try {
      print('Sending data to Firebase Function...');

      final response = await http.post(
        Uri.parse(_functionUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'message': message,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        print('Successfully sent data to Firebase Function');
        return true;
      } else {
        print(
            'Failed to send data to Firebase Function. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error sending data to Firebase Function: $e');
      return false;
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

class SlackService {
  Future<bool> sendNotification({
    required String name,
    required String email,
    required String message,
  }) async {
    try {
      print('Sending notification to Slack...');
      final proxyUrl = 'https://cytech-au-vercel.vercel.app/api/slack';

      // text形式のみで送信
      final slackPayload = {
        'text':
            '''
🔔 *New Message Received from CyTech Australia Website*

*Name:* $name
*Email:* $email
*Message:* $message

📝 CyTech Australiaウェブサイトからの送信
''',
      };

      print('Sending payload: ${jsonEncode(slackPayload)}');

      final response = await http.post(
        Uri.parse(proxyUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(slackPayload),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        print('Successfully sent notification to Slack');
        return true;
      } else {
        print(
          'Failed to send notification to Slack. Status code: ${response.statusCode}',
        );
        print('Error details: ${response.body}');
        return false;
      }
    } catch (e, stackTrace) {
      print('Error sending notification to Slack: $e');
      print('Stack trace: $stackTrace');
      return false;
    }
  }
}

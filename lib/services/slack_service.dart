import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/proxy_config.dart';

class SlackService {
  Future<bool> sendNotification({
    required String name,
    required String email,
    required String message,
  }) async {
    try {
      print('Sending notification to Slack...');
      print('Using proxy URL: ${ProxyConfig.proxyUrl}');

      // Slackに送信するメッセージのフォーマット
      final slackPayload = {
        'blocks': [
          {
            'type': 'header',
            'text': {
              'type': 'plain_text',
              'text': '🔔 New Message Received',
              'emoji': true
            }
          },
          {
            'type': 'section',
            'fields': [
              {'type': 'mrkdwn', 'text': '*Name:*\n$name'},
              {'type': 'mrkdwn', 'text': '*Email:*\n$email'}
            ]
          },
          {
            'type': 'section',
            'text': {'type': 'mrkdwn', 'text': '*Message:*\n$message'}
          },
          {
            'type': 'context',
            'elements': [
              {'type': 'mrkdwn', 'text': '📝 CyTech Australiaウェブサイトからの送信'}
            ]
          }
        ]
      };

      print('Sending payload: ${jsonEncode(slackPayload)}');

      final response = await http.post(
        Uri.parse(ProxyConfig.proxyUrl),
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
            'Failed to send notification to Slack. Status code: ${response.statusCode}');
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

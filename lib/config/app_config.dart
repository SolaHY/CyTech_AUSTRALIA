import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get slackWebhookUrl => dotenv.env['SLACK_WEBHOOK_URL'] ?? '';
}

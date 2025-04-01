class Environment {
  static const bool isDevelopment =
      bool.fromEnvironment('dart.vm.product') == false;

  static String get slackWebhookUrl {
    if (isDevelopment) {
      return 'http://localhost:3000/api/slack'; // 開発環境用のプロキシURL
    } else {
      return const String.fromEnvironment(
          'SLACK_WEBHOOK_URL'); // 本番環境用のWebhook URL
    }
  }
}

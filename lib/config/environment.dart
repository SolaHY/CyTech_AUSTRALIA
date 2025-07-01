class Environment {
  static const bool isDevelopment =
      bool.fromEnvironment('dart.vm.product') == false;

  static String get slackWebhookUrl {
    if (isDevelopment) {
      return 'https://hooks.slack.com/services/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';
    } else {
      return const String.fromEnvironment('SLACK_WEBHOOK_URL');
    }
  }
}

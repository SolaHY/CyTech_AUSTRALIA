class ProxyConfig {
  // For development
  // static const String devUrl = 'http://localhost:3000/api/slack';

  // For production - uncomment this and comment out devUrl when deploying
  static const String devUrl = 'https://cytech-australia.com/';

  static String get proxyUrl => devUrl;
}

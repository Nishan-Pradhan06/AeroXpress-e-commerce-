enum Environment { development, production }

class EnvConfig {
  final Environment environment;
  final String apiBaseUrl;
  final bool enableLogging;

  EnvConfig({
    required this.environment,
    required this.apiBaseUrl,
    required this.enableLogging,
  });

  // Development environment configuration
  factory EnvConfig.development() {
    return EnvConfig(
      environment: Environment.development,
      apiBaseUrl: 'https://safari.lunarit.com.np/api/',
      enableLogging: true,
    );
  }

  // Production environment configuration
  factory EnvConfig.production() {
    return EnvConfig(
      environment: Environment.production,

      ///TODO:: need to replace
      apiBaseUrl: '<replace with production url>',

      enableLogging: false,
    );
  }

  static late EnvConfig _instance;

  static void initialize(Environment env) {
    switch (env) {
      case Environment.development:
        _instance = EnvConfig.development();
        break;
      case Environment.production:
        _instance = EnvConfig.production();
        break;
    }
  }

  static EnvConfig get instance => _instance;
}

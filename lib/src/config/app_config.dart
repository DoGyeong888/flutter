/// App-wide configuration values and helpers.
///
/// In larger apps this can be expanded to hold API endpoints, feature flags,
/// or platform-specific toggles. Values are immutable to keep configuration
/// predictable across environments.
enum AppEnvironment { dev, prod }

class AppConfig {
  const AppConfig({required this.environment, required this.appTitle});

  factory AppConfig.fromEnvironment(String environment) {
    final normalized = environment.toLowerCase();
    if (normalized == 'prod' || normalized == 'production') {
      return const AppConfig(
        environment: AppEnvironment.prod,
        appTitle: 'Ready-to-Deploy Flutter',
      );
    }

    // Default to development for unknown values to keep local builds safe.
    return const AppConfig(
      environment: AppEnvironment.dev,
      appTitle: 'Ready-to-Deploy Flutter (Dev)',
    );
  }

  final AppEnvironment environment;
  final String appTitle;

  bool get isProd => environment == AppEnvironment.prod;
}

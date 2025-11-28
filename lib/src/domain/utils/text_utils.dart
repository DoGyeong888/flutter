/// Returns a friendly greeting for the provided name.
///
/// This function stays pure to keep it easily testable. Replace it with your
/// own domain-specific helpers as you grow the project.
String buildGreeting(String name) {
  final trimmed = name.trim();
  if (trimmed.isEmpty) return 'Hello there!';
  final capitalized = trimmed[0].toUpperCase() + trimmed.substring(1);
  return 'Hello, $capitalized!';
}

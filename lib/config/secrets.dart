import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Centralized accessor for environment-backed secrets.
/// Falls back to --dart-define values when .env is not bundled.
class Secrets {
  static String get supabaseUrl => _read('SUPABASE_URL');
  static String get supabaseAnonKey => _read('SUPABASE_ANON_KEY');
  static String get powersyncEndpoint => _read('POWERSYNC_ENDPOINT_URL');

  static String _read(String key) {
    final value = dotenv.env[key] ?? String.fromEnvironment(key, defaultValue: '');
    if (value.isEmpty) {
      throw StateError('Missing environment value for $key. Add it to .env or pass --dart-define=$key.');
    }
    return value;
  }
}

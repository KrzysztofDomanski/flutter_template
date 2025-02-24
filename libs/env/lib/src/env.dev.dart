import 'package:envied/envied.dart';

part 'env.dev.g.dart';

/// Provides access to environment variables used in the development
/// environment.
@Envied(path: '.env.dev', obfuscate: true)
abstract class EnvDev {
  /// The URL to our supabase database
  @EnviedField(varName: 'SUPABASE_URL', obfuscate: true)
  static String supabaseUrl = _EnvDev.supabaseUrl;

  /// The anon key to our supbase database
  @EnviedField(varName: 'SUPABASE_ANON_KEY', obfuscate: true)
  static String supabaseAnonKey = _EnvDev.supabaseAnonKey;

  /// The URL of our Powersync instance
  @EnviedField(varName: 'POWERSYNC_URL', obfuscate: true)
  static String powersyncUrl = _EnvDev.powersyncUrl;
}

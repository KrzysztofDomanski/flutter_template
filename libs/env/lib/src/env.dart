// ignore_for_file: public_member_api_docs

enum Env {
  supabaseUrl('SUPABASE_URL'),
  powerSyncUrl('POWERSYNC_URL'),
  supabaseAnonKey('SUPABASE_ANON_KEY');

  const Env(this.value);

  final String value;
}

/// Env value signature that can be used to get an environment value, base
/// on provided [Env].
typedef EnvValue = String Function(Env env);

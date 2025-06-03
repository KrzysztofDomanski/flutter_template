import 'package:auth_client/auth_client.dart';
import 'package:flutter/foundation.dart';
import 'package:powersync_repository/powersync_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

/// {@template supabase_auth_client}
/// Supabase authentication client interface
/// {@endtemplate}
class SupabaseAuthClient implements AuthClient {
  /// {@macro supabase_auth_client}
  const SupabaseAuthClient({required PowersyncRepository powersyncRepository})
      : _powersyncRepository = powersyncRepository;

  final PowersyncRepository _powersyncRepository;

  @override
  Stream<AuthUser> get user {
    return _powersyncRepository.authStateChanges().map((authState) {
      final supabaseUser = authState.session?.user;
      return supabaseUser == null
          ? const AuthUser(id: '', email: '')
          : supabaseUser.toAuthUser;
    });
  }

  @override
  Future<void> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await _powersyncRepository.supabase.auth.signUp(
        email: email,
        password: password,
        emailRedirectTo: kIsWeb ? null : '//',
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SignUpWithEmailAndPasswordFailure(error),
        stackTrace,
      );
    }
  }
}

extension on supabase.User {
  AuthUser get toAuthUser {
    return AuthUser(
      id: id,
      email: email,
    );
  }
}

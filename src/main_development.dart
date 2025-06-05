import 'package:database_client/database_client.dart';
import 'package:shared/shared.dart';
import 'package:supabase_auth_client/supabase_auth_client.dart';
import 'package:user_repository/user_repository.dart';
import 'app/app.dart';
import 'bootstrap.dart';

void main() {
  bootstrap(
    appFlavor: AppFlavor.development(),
    (powersyncRepository) async {
      final authClient =
          SupabaseAuthClient(powersyncRepository: powersyncRepository);

      final databaseClient =
          PowersyncDatabaseClient(powersyncRepository: powersyncRepository);

      final userRepository = UserRepository(
          databaseClient: databaseClient, authClient: authClient);

      return App(
        powersyncRepository: powersyncRepository,
        userRepository: userRepository,
        user: await userRepository.user.first,
      );
    },
  );
}

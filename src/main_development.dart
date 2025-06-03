import 'package:database_client/database_client.dart';
import 'package:shared/shared.dart';
import 'package:user_repository/user_repository.dart';
import 'app/app.dart';
import 'bootstrap.dart';

void main() {
  bootstrap(
    appFlavor: AppFlavor.development(),
    (powersyncRepository) async {
      final databaseClient =
          PowersyncDatabaseClient(powersyncRepository: powersyncRepository);

      final userRepository = UserRepository(databaseClient: databaseClient);

      return App(
        powersyncRepository: powersyncRepository,
        userRepository: userRepository,
      );
    },
  );
}

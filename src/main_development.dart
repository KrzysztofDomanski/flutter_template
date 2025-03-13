import 'package:api_repository/api_repository.dart';
import 'package:shared/shared.dart';
import 'app/app.dart';
import 'bootstrap.dart';

void main() {
  const apiRepository = ApiRepository();
  bootstrap(
    appFlavor: AppFlavor.development(),
    (powersyncRepository) => const App(
      apiRepository: apiRepository,
    ),
  );
}

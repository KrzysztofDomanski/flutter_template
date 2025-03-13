import 'package:api_repository/api_repository.dart';
import 'package:shared/shared.dart';
import 'app/app.dart';
import 'bootstrap.dart';

void main() {
  const apiRepository = ApiRepository();
  bootstrap(
    appFlavor: AppFlavor.staging(),
    (powersyncRepository) => const App(
      apiRepository: apiRepository,
    ),
  );
}

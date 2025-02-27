import 'package:api_repository/api_repository.dart';
import 'app/app.dart';
import 'bootstrap.dart';

void main() {
  const apiRepository = ApiRepository();
  bootstrap(
    () => const App(
      apiRepository: apiRepository,
    ),
  );
}

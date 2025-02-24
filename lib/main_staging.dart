import 'package:api_repository/api_repository.dart';
import 'package:flutter_template/app/app.dart';
import 'package:flutter_template/bootstrap.dart';

void main() {
  const apiRepository = ApiRepository();
  bootstrap(
    () => const App(
      apiRepository: apiRepository,
    ),
  );
}

import 'package:api_repository/api_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../src/app/app.dart';
import '../../../src/todos/view/todos_view.dart';

void main() {
  const apiRepository = ApiRepository();
  group('App', () {
    testWidgets('renders TodosPage', (tester) async {
      await tester.pumpWidget(
        const App(
          apiRepository: apiRepository,
        ),
      );
      expect(find.byType(TodosPage), findsOneWidget);
    });
  });
}

/// {@template api_repository}
/// A fake repository for my data
/// {@endtemplate}
class ApiRepository {
  /// {@macro api_repository}
  const ApiRepository();

  /// Retrieves a fake list of todo items
  List<String> fetchTodos() => ['Do this', 'Then maybe this', ' finally this'];
}

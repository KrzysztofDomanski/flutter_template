import 'package:api_repository/api_repository.dart';
import 'package:bloc/bloc.dart';

class TodosCubit extends Cubit<List<String>> {
  TodosCubit(this._apiRepository) : super([]);

  final ApiRepository _apiRepository;

  void fetchTodos() => emit(_apiRepository.fetchTodos());
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required User user, required UserRepository userRepository})
      : _userRepository = userRepository,
        super(
          AppInitial(
            status: user.isAnonymous
                ? AppStatus.unauthenticated
                : AppStatus.authenticated,
          ),
        ) {
    on<AppUserChanged>(_onUserChanged);
    on<AppUserLogoutRequested>(_onLogoutRequested);

    _userSubscription =
        userRepository.user.listen(_userChanged, onError: addError);
  }

  final UserRepository _userRepository;
  StreamSubscription<User>? _userSubscription;

  void _userChanged(User user) => add(AppUserChanged(user));

  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    final user = event.user;

    switch (state.status) {
      case AppStatus.subscriptionRequired:
      case AppStatus.authenticated:
      case AppStatus.unauthenticated:
        return !user.isAnonymous && user.isNewUser
            ? emit(AppState.subscriptionRequired(user))
            : user.isAnonymous
                ? emit(const AppState.unauthenticated())
                : emit(AppState.authenticated(user));
    }
  }

  void _onLogoutRequested(
          AppUserLogoutRequested event, Emitter<AppState> emit) =>
      _userRepository.logout();

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}

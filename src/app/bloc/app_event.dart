part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

final class AppUserChanged extends AppEvent {
  const AppUserChanged(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}

final class AppUserLogoutRequested extends AppEvent {
  const AppUserLogoutRequested(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}

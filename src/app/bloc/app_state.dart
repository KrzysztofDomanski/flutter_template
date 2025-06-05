part of 'app_bloc.dart';

enum AppStatus {
  authenticated,

  unauthenticated,

  subscriptionRequired,
}

class AppState extends Equatable {
  const AppState({required this.status, this.user = User.anonymous});

  const AppState.authenticated(User user)
      : this(status: AppStatus.authenticated, user: user);

  const AppState.subscriptionRequired(User user)
      : this(status: AppStatus.subscriptionRequired, user: user);

  const AppState.unauthenticated()
      : this(status: AppStatus.unauthenticated, user: User.anonymous);

  final AppStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}

final class AppInitial extends AppState {
  const AppInitial({required super.status});
}

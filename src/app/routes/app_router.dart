import 'package:go_router/go_router.dart';

import '../../auth/view/auth_page.dart';
import '../bloc/app_bloc.dart';
import 'routes.dart';

class AppRouter {
  AppRouter(this.appBloc);

  final AppBloc appBloc;

  GoRouter get router => GoRouter(
        initialLocation: AppRoutes.auth.route,
        routes: [
          GoRoute(
            path: AppRoutes.auth.route,
            name: AppRoutes.auth.name,
            builder: (context, state) => const AuthPage(),
          ),
        ],
        redirect: (context, state) {
          final authenticated = appBloc.state.status == AppStatus.authenticated;
          if (!authenticated) return AppRoutes.auth.route;
        },
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:powersync_repository/powersync_repository.dart';
import 'package:user_repository/user_repository.dart';
import 'app_view.dart';

class App extends StatelessWidget {
  const App({
    required this.powersyncRepository,
    required this.userRepository,
    super.key,
  });

  final PowersyncRepository powersyncRepository;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: powersyncRepository,
        ),
        RepositoryProvider.value(
          value: userRepository,
        )
      ],
      child: const AppView(),
    );
  }
}

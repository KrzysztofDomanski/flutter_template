import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/auth_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Text("Social Fitness Bristol"),
          TextField(),
          TextField(),
          ElevatedButton(onPressed: () {}, child: Text("Log in")),
          Spacer(),
          TextButton(
              onPressed: () =>
                  context.read<AuthCubit>().changeAuth(showLogin: false),
              child: Text("Don't have an account? Sign up here"))
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../cubit/auth_cubit.dart';
import '../cubit/sign_up_cubit.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  String? _error;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController(text: '');
    _passwordController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailError =
        context.select((SignUpCubit cubit) => cubit.state.email.errorMessage);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            decoration:
                InputDecoration(labelText: 'Email', errorText: emailError),
            onChanged: (v) => context.read<SignUpCubit>().onEmailChanged(v),
          ),
          TextFormField(
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: 'Password',
              errorText: _error,
            ),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () {
              _signUp(context);
            },
            child: const Text('Sign up'),
          ),
          const Spacer(),
          TextButton(
              onPressed: () =>
                  context.read<AuthCubit>().changeAuth(showLogin: true),
              child: Text("Already have an account? Sign in")),
        ],
      ),
    );
  }

  Future<void> _signUp(BuildContext context) async {
    setState(() {
      _error = null;
    });
    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: _emailController.text,
        password: _passwordController.text,
      );
      logD(response.toString());
    } on AuthException catch (e) {
      _error = e.message;
      logE(_error);
      setState(() {});
    } catch (e) {
      _error = e.toString();
      logE(_error);
      setState(() {});
    }
  }
}

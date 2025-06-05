import 'package:bloc/bloc.dart';

class AuthCubit extends Cubit<bool> {
  AuthCubit() : super(true);

  /// Defines method to change auth from login to signup or reversed.
  void changeAuth({required bool showLogin}) => emit(showLogin);
}

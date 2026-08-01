import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repo/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  Future<void> login() async {
    emit(LoginState.loading());

    final result = await _loginRepo.login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    // if (isClosed) return;

    result.fold(
      (failure) {
        emit(LoginState.error(failure.message));
      },
      (user) {
        emit(LoginState.success()); // دلوقتي آمن
      },
    );
  }

  @override
  Future<void> close() {
    // ignore: invalid_use_of_protected_member
    formKey.currentState?.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    return super.close();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/model/signup_model.dart';
import '../data/repo/sign_repo.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignUpRepo _signUpRepo;
  SignupCubit(this._signUpRepo) : super(SignupState.initial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  Future<void> signup() async {
    emit(SignupState.loading());
    final result = await _signUpRepo.signUp(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      // phone: phoneNumberController.text.trim(),
      metadata: SignupModel(
        fullName: nameController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
      ),
    );

    result.fold((failure) {
      emit(SignupState.error(failure.message));
      debugPrint('Signup failed: ${failure.message}');
    }, 
    (user) => emit(SignupState.success()));
  }

  @override
  Future<void> close() {
    // ignore: invalid_use_of_protected_member
    formKey.currentState!.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    return super.close();
  }
}

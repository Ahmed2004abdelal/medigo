import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/extension.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/auth_switch_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../logic/login_cubit.dart';
import 'widgets/forgot_button.dart';
import 'widgets/login_bloc_builder.dart';
import 'widgets/login_linstener_cubit.dart';
import 'widgets/or_continue_with.dart';
import 'widgets/social_media_buttons.dart';

import '../../../../core/theming/app_text_style.dart';
import '../../../../l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;

  @override
  initState() {
    super.initState();
    formKey = context.read<LoginCubit>().formKey;
    emailController = context.read<LoginCubit>().emailController;
    passwordController = context.read<LoginCubit>().passwordController;
    emailFocusNode = context.read<LoginCubit>().emailFocusNode;
    passwordFocusNode = context.read<LoginCubit>().passwordFocusNode;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 24.0.w,
              vertical: 30.0.h,
            ),
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.goAheadSetUpYourAccount,
                      style: AppTextStyle.font24Black600.copyWith(
                        height: 1.3.h,
                      ),
                    ),
                    verticalSpace(15),
                    Text(
                      AppLocalizations.of(
                        context,
                      )!.welcomeBackPleaseSignInToManageYourAccount,
                      style: AppTextStyle.font14Grey400,
                    ),
                    verticalSpace(40),
                    CustomTextFormField(
                      outLable: AppLocalizations.of(context)!.email,
                      hintText: 'user@mail.com',
                      controller: emailController,
                      focusNode: emailFocusNode,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        if (value.contains(RegExp(r' '))) {
                          return 'the email address should not contain spaces';
                        }
                        return null;
                      },
                      onFieldSubmitted: (p0) {
                        FocusScope.of(context).requestFocus(passwordFocusNode);
                      },
                    ),
                    verticalSpace(30),
                    CustomTextFormField(
                      outLable: AppLocalizations.of(context)!.password,
                      hintText: '**************',
                      controller: passwordController,
                      focusNode: passwordFocusNode,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      onFieldSubmitted: (p0) {
                        FocusScope.of(context).unfocus();
                      },
                    ),
                    verticalSpace(20),
                    ForgotButton(),
                    verticalSpace(20),
                    LoginBlocBuilder(),
                    verticalSpace(35),
                    OrContinueWith(),
                    verticalSpace(35),
                    SocialMediaButtons(),
                    Spacer(),
                    AuthSwitchButton(
                      actionText: AppLocalizations.of(context)!.register,
                      onPressed: () {
                        context.pushNamed(Routes.signup);
                      },
                      text: AppLocalizations.of(context)!.dontHaveAnAccount,
                    ),
                    LoginLinstenerCubit(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

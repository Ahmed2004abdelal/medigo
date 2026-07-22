import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/extension.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_text_style.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/auth_switch_button.dart';
import '../logic/signup_cubit.dart';
import 'widget/signup_bloc_builder.dart';
import 'widget/signup_bloc_listener.dart';
import '../../../../l10n/app_localizations.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late GlobalKey<FormState> formKey;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late FocusNode nameFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode phoneNumberFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;

  @override
  initState() {
    super.initState();
    formKey = context.read<SignupCubit>().formKey;
    nameController = context.read<SignupCubit>().nameController;
    emailController = context.read<SignupCubit>().emailController;
    phoneNumberController = context.read<SignupCubit>().phoneNumberController;
    passwordController = context.read<SignupCubit>().passwordController;
    confirmPasswordController = context
        .read<SignupCubit>()
        .confirmPasswordController;
    nameFocusNode = context.read<SignupCubit>().nameFocusNode;
    emailFocusNode = context.read<SignupCubit>().emailFocusNode;
    phoneNumberFocusNode = context.read<SignupCubit>().phoneNumberFocusNode;
    passwordFocusNode = context.read<SignupCubit>().passwordFocusNode;
    confirmPasswordFocusNode = context
        .read<SignupCubit>()
        .confirmPasswordFocusNode;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
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
                        AppLocalizations.of(context)!.createYourAccount,
                        style: AppTextStyle.font24Black600.copyWith(
                          height: 1.3.h,
                        ),
                      ),
                      verticalSpace(15),
                      Text(
                        AppLocalizations.of(
                          context,
                        )!.signUpToManageYourAccountEffortlessly,
                        style: AppTextStyle.font14Grey400,
                      ),
                      verticalSpace(30),
                      CustomTextFormField(
                        outLable: AppLocalizations.of(context)!.fullName,
                        hintText: 'User',
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        focusNode: nameFocusNode,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (p0) {
                          FocusScope.of(
                            context,
                          ).requestFocus(passwordFocusNode);
                        },
                      ),
                      verticalSpace(30),
                      CustomTextFormField(
                        outLable: AppLocalizations.of(context)!.email,
                        hintText: 'user@mail.com',
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        focusNode: emailFocusNode,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (p0) {
                          FocusScope.of(
                            context,
                          ).requestFocus(passwordFocusNode);
                        },
                      ),
                      verticalSpace(30),
                      CustomTextFormField(
                        outLable: AppLocalizations.of(context)!.phoneNumber,
                        hintText: '+216',
                        controller: phoneNumberController,
                        keyboardType: TextInputType.phone,
                        focusNode: phoneNumberFocusNode,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (p0) {
                          FocusScope.of(
                            context,
                          ).requestFocus(passwordFocusNode);
                        },
                      ),
                      verticalSpace(30),
                      CustomTextFormField(
                        outLable: AppLocalizations.of(context)!.password,
                        hintText: '**************',
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        onFieldSubmitted: (p0) {
                          FocusScope.of(
                            context,
                          ).requestFocus(confirmPasswordFocusNode);
                        },
                      ),
                      verticalSpace(30),
                      CustomTextFormField(
                        outLable: AppLocalizations.of(context)!.confirmPassword,
                        hintText: '**************',
                        controller: confirmPasswordController,
                        focusNode: confirmPasswordFocusNode,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        onFieldSubmitted: (p0) {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                      verticalSpace(35),
                      SignupBlocBuilder(),
                      verticalSpace(30),
                      AuthSwitchButton(
                        text: AppLocalizations.of(
                          context,
                        )!.alreadyHaveAnAccount,
                        actionText: AppLocalizations.of(context)!.login,
                        onPressed: () {
                          context.pushNamed(Routes.login);
                        },
                      ),
                      SignupBlocListener(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

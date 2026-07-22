import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/app_text_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../logic/login_cubit.dart';
import '../../logic/login_state.dart';
import '../../../../../l10n/app_localizations.dart';

class LoginBlocBuilder extends StatelessWidget {
  const LoginBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
  void validateAndSubmit(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().login();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CustomSnackBar(
            text: AppLocalizations.of(context)!.pleaseFillAllFields, 
            color: Colors.red
            ),
          backgroundColor: Colors.transparent,
        ),
      );
    }
  }
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context,state){
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );
        return CustomButton(
          onPressed: isLoading ? null : () => validateAndSubmit(context),
          size: Size(double.infinity, 50.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: isLoading
              ? SizedBox(
                  width: 24.w,
                  height: 24.h,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ),
                )
              : Text(
                  AppLocalizations.of(context)!.login,
                  style: AppTextStyle.font16White600,
                ),
        );
      }
      );
  }
}
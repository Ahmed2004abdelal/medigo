import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/app_text_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../logic/signup_cubit.dart';
import '../../logic/signup_state.dart';
import '../../../../../l10n/app_localizations.dart';

class SignupBlocBuilder extends StatelessWidget {
  const SignupBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
      // ignore: no_leading_underscores_for_local_identifiers
  void validateAndSubmit(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().signup();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.pleaseFillAllFields),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
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
                  AppLocalizations.of(context)!.register,
                  style: AppTextStyle.font16White600,
                ),
        );
      },
    );
  }
}

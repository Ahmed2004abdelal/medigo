import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/extension.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../logic/login_cubit.dart';
import '../../logic/login_state.dart';

class LoginLinstenerCubit extends StatelessWidget {
  const LoginLinstenerCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          success: () {
  context.pushNamedAndRemoveUntil(
    Routes.home,
    predicate: (route) => false,
  );
},
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: CustomSnackBar(color: Colors.red, text: message),
                backgroundColor: Colors.transparent,
              ),
            );
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}

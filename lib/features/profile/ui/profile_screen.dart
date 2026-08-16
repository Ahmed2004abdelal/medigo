import 'package:flutter/material.dart';
import 'package:medigo/core/helpers/extension.dart';
import 'package:medigo/core/theming/app_text_style.dart';
import 'package:medigo/core/widgets/custom_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/network/auth/supabase_auth_services.dart';
import '../../../core/routing/routes.dart';

class ProfileScreen extends StatelessWidget {
  final SupabaseAuthServices _authServices = SupabaseAuthServicesImpl(
    Supabase.instance.client,
  );
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: CustomButton(
          onPressed: () {
            _authServices.signOut().then((result) {
              result.fold(
                (failure) {
                  // Handle sign-out failure
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Sign-out failed: ${failure.message}'),
                    ),
                  );
                },
                (unit) {
                  context.pushNamedAndRemoveUntil(
                    Routes.login,
                    predicate: (route) => false,
                  );
                },
              );
            });
          },
          child: Text("Logout", style: AppTextStyle.font16Black600),
        ),
      ),
    );
  }
}

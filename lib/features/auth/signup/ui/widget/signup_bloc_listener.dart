import 'package:flutter/material.dart';
import '../../../../../core/helpers/extension.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/signup_cubit.dart';
import '../../logic/signup_state.dart';
import '../../../../../l10n/app_localizations.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () => () {},
          success: () => _showSuccessDialog(
            context: context,
            email: context.read<SignupCubit>().emailController.text.trim(),
          ),
          error: (message) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: CustomSnackBar(text: message, color: Colors.red),
            backgroundColor: Colors.transparent,
            ),
          ),
        );
      },
      child: Container(),
    );
  }
}

void _showSuccessDialog({
  required BuildContext context,
  required String email,
}) {
  showDialog(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: Text(AppLocalizations.of(context)!.success),
        content: Text(
          AppLocalizations.of(context)!.checkyouremailtoverification,
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await _openEmailApp(dialogContext, email);
            },
            child: Text(AppLocalizations.of(context)!.openemail),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
            },
            child: Text(AppLocalizations.of(context)!.ok),
          ),
        ],
      );
    },
  );
}

Future<void> _openEmailApp(BuildContext context, String email) async {
  final Uri emailLaunchUri = Uri(scheme: 'mailto');
  final Uri webmailUri = _webmailUrlFor(email);
  bool launched = false;

  try {
    if (await canLaunchUrl(emailLaunchUri)) {
      launched = await launchUrl(
        emailLaunchUri,
        mode: LaunchMode.externalApplication,
      );
    }
    if (!launched) {
      launched = await launchUrl(
        webmailUri,
        mode: LaunchMode.externalApplication,
      );
    }
  } catch (e) {
    launched = false;
    debugPrint('openEmailApp error: $e');
  }

  if (!context.mounted) return;

  if (launched) {
    context.pushReplacementNamed(Routes.login);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      
      SnackBar(
        content:  CustomSnackBar(
        text: AppLocalizations.of(context)!.noemailapp,
        color: Colors.red,
      ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

Uri _webmailUrlFor(String email) {
  final domain = email.contains('@') ? email.split('@').last.toLowerCase() : '';

  switch (domain) {
    case 'gmail.com':
    case 'googlemail.com':
      return Uri.parse('https://mail.google.com');
    case 'outlook.com':
    case 'hotmail.com':
    case 'live.com':
      return Uri.parse('https://outlook.live.com/mail');
    case 'yahoo.com':
      return Uri.parse('https://mail.yahoo.com');
    case 'icloud.com':
      return Uri.parse('https://www.icloud.com/mail');
    default:
      return Uri.parse('https://mail.google.com');
  }
}

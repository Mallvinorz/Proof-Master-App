import 'package:flutter/material.dart';
import 'package:proofmaster/app/presentation/views/signin/widgets/signin_form.dart';
import 'package:proofmaster/app/presentation/templates/bakground_oval.dart';
import 'package:proofmaster/theme/text_theme.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  final String title = "Selamat Datang";
  final String desc = "Masuk untuk melanjutkan";

  @override
  Widget build(BuildContext context) {
    return BackgroundOval(
        children: Padding(
      padding: const EdgeInsets.only(top: 72.0, left: 16, right: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: CustomTextTheme.proofMasterTextTheme.displayLarge
                  ?.copyWith(color: Colors.white),
            ),
            Text(
              desc,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 62,
            ),
            const SigninForm()
          ],
        ),
      ),
    ));
  }
}

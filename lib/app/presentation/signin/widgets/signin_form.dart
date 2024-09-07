import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/presentation/onboarding/onboarding_view.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/widgets/button.dart';
import 'package:proofmaster/widgets/input.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Input(
              label: "Email",
              placeholder: "Masukkan email",
              inputType: InputType.email),
          const SizedBox(
            height: 16,
          ),
          Input(
              label: "Password",
              placeholder: "Masukkan password",
              inputType: InputType.password),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: () => context.push(ProofmasterRoute.forgotPassword),
                    child: const Text(
                      "Lupa password?",
                      style: TextStyle(color: CustomColorTheme.colorPrimary),
                    ))),
          ),
          SizedBox(
              width: double.infinity,
              child: Button(onTap: () {}, text: "Masuk")),
          Align(
            alignment: Alignment.center,
            child: Text.rich(TextSpan(text: "Belum punya akun? ", children: [
              TextSpan(
                  text: "Daftar",
                  style: const TextStyle(color: CustomColorTheme.colorPrimary),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => context.push(ProofmasterRoute.register))
            ])),
          )
        ],
      ),
    );
  }
}

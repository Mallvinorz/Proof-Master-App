import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/presentation/onboarding/onboarding_view.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/widgets/button.dart';
import 'package:proofmaster/widgets/input.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

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
              label: "NIM",
              placeholder: "Masukkan nim",
              inputType: InputType.nim),
          _margin(),
          Input(
              label: "Email",
              placeholder: "Masukkan email",
              inputType: InputType.email),
          _margin(),
          Input(
              label: "Nama lengkap",
              placeholder: "Masukkan nama lengkap",
              inputType: InputType.fullname),
          _margin(),
          Input(
              label: "Password",
              placeholder: "Masukkan password",
              inputType: InputType.password),
          _margin(),
          Input(
              label: "Konfirmasi password",
              placeholder: "Tulis ulang password",
              inputType: InputType.password),
          _margin(),
          const Align(
            alignment: Alignment.center,
            child: Text.rich(TextSpan(children: [
              TextSpan(
                text: "Dengan mendaftar, anda telah menyetujui ",
              ),
              TextSpan(
                text: "Terms and Conditions ",
                style: TextStyle(color: CustomColorTheme.colorPrimary),
              ),
              TextSpan(
                text: "dan ",
              ),
              TextSpan(
                text: "Policy ",
                style: TextStyle(color: CustomColorTheme.colorPrimary),
              ),
            ])),
          ),
          _margin(),
          SizedBox(
              width: double.infinity,
              child: Button(onTap: () {}, text: "Daftar")),
          _margin(),
          Align(
            alignment: Alignment.center,
            child: Text.rich(TextSpan(text: "Sudah punya akun? ", children: [
              TextSpan(
                  text: "Masuk",
                  style: const TextStyle(color: CustomColorTheme.colorPrimary),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => context.push(ProofmasterRoute.auth))
            ])),
          )
        ],
      ),
    );
  }

  Widget _margin() {
    return const SizedBox(
      height: 16,
    );
  }
}

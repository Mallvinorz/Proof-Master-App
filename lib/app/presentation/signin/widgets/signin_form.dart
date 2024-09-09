import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/presentation/providers/auth_provider/auth_provider.dart';
import 'package:proofmaster/app/presentation/signup/widgets/signup_dialog.dart';
import 'package:proofmaster/app/utils/ui_state.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/widgets/button.dart';
import 'package:proofmaster/widgets/input.dart';

class SigninForm extends ConsumerWidget {
  const SigninForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Input(
              errorText: authState.email.errorMessage,
              onChange: (value) => ref
                  .read(authProvider.notifier)
                  .updateInputState(email: value),
              label: "Email",
              placeholder: "Masukkan email",
              inputType: InputType.email),
          const SizedBox(
            height: 16,
          ),
          Input(
              errorText: authState.password.errorMessage,
              onChange: (value) => ref
                  .read(authProvider.notifier)
                  .updateInputState(password: value),
              label: "Password",
              placeholder: "Masukkan password",
              inputType: InputType.password),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: () => context.push(ProofmasterRoute
                        .home), //TODO: replace with actual reset password route
                    child: const Text(
                      "Lupa password?",
                      style: TextStyle(color: CustomColorTheme.colorPrimary),
                    ))),
          ),
          SizedBox(
              width: double.infinity,
              child: Button(
                onTap: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    final result =
                        await ref.read(authProvider.notifier).performSignin();
                    // ignore: use_build_context_synchronously
                    context.replace(result == "TEACHER"
                        ? ProofmasterRoute.lecturerHome
                        : ProofmasterRoute.home);
                  } catch (e) {
                    await signupAlertDialog(
                        message: e.toString(),
                        isSuccess: false,
                        onClose: () {},
                        // ignore: use_build_context_synchronously
                        context: context);
                  }
                },
                text: "Masuk",
                onProgress: authState.uiState is UILoading ? true : false,
              )),
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

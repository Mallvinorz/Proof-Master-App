import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/presentation/providers/register_provider/register_provider.dart';
import 'package:proofmaster/app/presentation/widgets/alert_dialog.dart';
import 'package:proofmaster/app/utils/ui_state.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/app/presentation/widgets/button.dart';
import 'package:proofmaster/app/presentation/widgets/input.dart';

class SignupForm extends ConsumerWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerState = ref.watch(registerProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Input(
              errorText: registerState.nim.errorMessage,
              onChange: (value) => ref
                  .read(registerProvider.notifier)
                  .updateInputState(nim: value),
              label: "NIM",
              placeholder: "Masukkan nim",
              inputType: InputType.nim),
          _margin(),
          Input(
              errorText: registerState.email.errorMessage,
              onChange: (value) => ref
                  .read(registerProvider.notifier)
                  .updateInputState(email: value),
              label: "Email",
              placeholder: "Masukkan email",
              inputType: InputType.email),
          _margin(),
          Input(
              errorText: registerState.name.errorMessage,
              onChange: (value) => ref
                  .read(registerProvider.notifier)
                  .updateInputState(name: value),
              label: "Nama lengkap",
              placeholder: "Masukkan nama lengkap",
              inputType: InputType.fullname),
          _margin(),
          Input(
              errorText: registerState.password.errorMessage,
              onChange: (value) => ref
                  .read(registerProvider.notifier)
                  .updateInputState(password: value),
              label: "Password",
              placeholder: "Masukkan password",
              inputType: InputType.password),
          _margin(),
          Input(
              errorText: registerState.passwordConfirm.errorMessage,
              onChange: (value) => ref
                  .read(registerProvider.notifier)
                  .updateInputState(passwordConfirm: value),
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
              child: Button(
                onTap: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  //close keyboard
                  try {
                    await ref
                        .read(registerProvider.notifier)
                        .performRegisterAccount();
                    // ignore: use_build_context_synchronously
                    await alertDialog(
                        title: 'Registrasi Sukses!',
                        message:
                            "Registrasi akun anda telah berhasil, klik tombol 'Kembali ke halaman login' untuk kembali ke halaman login.",
                        isSuccess: true,
                        actionWidgets: [
                          TextButton(
                            style: TextButton.styleFrom(
                              // ignore: use_build_context_synchronously
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('Kembali ke halaman login'),
                            onPressed: () {
                              context.pop();
                              context.replace(ProofmasterRoute.auth);
                            },
                          ),
                        ],
                        // ignore: use_build_context_synchronously
                        context: context);
                  } catch (e) {
                    await alertDialog(
                        title: 'Register Gagal!',
                        message: e.toString(),
                        isSuccess: false,
                        actionWidgets: [
                          TextButton(
                            style: TextButton.styleFrom(
                              // ignore: use_build_context_synchronously
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('Tutup'),
                            onPressed: () {
                              context.pop();
                            },
                          ),
                        ],
                        // ignore: use_build_context_synchronously
                        context: context);
                  }
                },
                text: "Daftar",
                onProgress: registerState.uiState is UILoading ? true : false,
              )),
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

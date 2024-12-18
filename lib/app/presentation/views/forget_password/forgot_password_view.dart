import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/presentation/providers/reset_password_provider/reset_password_provider.dart';
import 'package:proofmaster/app/presentation/templates/background_pattern.dart';
import 'package:proofmaster/app/presentation/widgets/alert_dialog.dart';
import 'package:proofmaster/app/utils/ui_state.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/app/presentation/widgets/button.dart';
import 'package:proofmaster/app/presentation/widgets/input.dart';

class ForgotPasswordView extends ConsumerStatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends ConsumerState<ForgotPasswordView> {
  final String _title = "Ubah Password";
  String email = "";
  onUpdateEmail(String email) {
    setState(() {
      email = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    final resetPasswordState = ref.watch(resetPasswordProvider);
    return BackgroundPattern(
      borderRadius: const BorderRadius.only(topRight: Radius.circular(20)),
      appBarTitle: _title,
      onTapNavBack: () => context.pop(),
      mainChildren: Stack(
        children: [
          const Image(image: AssetImage('assets/images/img_bg.png')),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Masukkan email akun anda!",
                  style: CustomTextTheme.proofMasterTextTheme.displayMedium,
                ),
                _margin(),
                const Text(
                    "Dengan mengklik tombol kirim email, maka akan muncul email untuk mereset password dari akun anda"),
                _margin(),
                Input(
                    errorText: resetPasswordState.email.errorMessage,
                    onChange: (value) => ref
                        .read(resetPasswordProvider.notifier)
                        .updateInputState(email: value),
                    placeholder: "Masukkan email",
                    inputType: InputType.email),
                _margin(),
                SizedBox(
                  width: double.infinity,
                  child: Button(
                      onProgress: resetPasswordState.uiState is UILoading,
                      onTap: () async {
                        if (resetPasswordState.uiState is UILoading) return;
                        try {
                          await ref
                              .read(resetPasswordProvider.notifier)
                              .performResetPasswordWithEmail();
                          // ignore: use_build_context_synchronously
                          context.go(ProofmasterRoute.successResetPassword);
                        } catch (e) {
                          alertDialog(
                              // ignore: use_build_context_synchronously
                              context: context,
                              message: 'Error: $e',
                              title: 'Error Saat Reset Password!',
                              isSuccess: false,
                              actionWidgets: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    // ignore: use_build_context_synchronously
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  child: const Text('Tutup'),
                                  onPressed: () {
                                    context.pop();
                                  },
                                ),
                              ]);
                        }
                      },
                      text: "Kirim email"),
                )
              ],
            ),
          ),
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

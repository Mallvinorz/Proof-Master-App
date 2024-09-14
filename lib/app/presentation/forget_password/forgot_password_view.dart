import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/templates/background_pattern.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/widgets/button.dart';
import 'package:proofmaster/widgets/input.dart';

class ForgotPasswordView extends ConsumerStatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends ConsumerState<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    return _content();
  }
}

class _content extends ConsumerWidget {
  const _content({super.key});
  final String _title = "Ubah Password";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                const Input(
                    placeholder: "Masukkan email", inputType: InputType.email),
                _margin(),
                SizedBox(
                  width: double.infinity,
                  child: Button(
                      onTap: () {
                        context.go(ProofmasterRoute.successResetPassword);
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

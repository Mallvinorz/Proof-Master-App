import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/presentation/providers/auth_provider/auth_provider.dart';
import 'package:proofmaster/app/presentation/templates/background_pattern_center_child.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/theme/text_theme.dart';

class SuccessResetPass extends ConsumerWidget {
  const SuccessResetPass({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BackgroundPatternCenterChild(
      child: _buildCardContent(),
      onTapBack: () async => await _navigateToAppropriateRoute(context, ref),
    );
  }

  Widget _buildCardContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          textAlign: TextAlign.center,
          "Email reset password telah dikirim!",
          style: CustomTextTheme.proofMasterTextTheme.displayMedium,
        ),
        SvgPicture.asset(
          'assets/images/success_reset_pass.svg',
          width: 240,
          height: 240,
        ),
        const Text(
          textAlign: TextAlign.center,
          "Silahkan cek inbox emailmu",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
        ),
      ],
    );
  }

  Future<void> _navigateToAppropriateRoute(
      BuildContext context, WidgetRef ref) async {
    final authRepository = ref.read(authRepositoryProvider);
    final token = await authRepository.getAuthToken();
    final role = await authRepository.getRole();
    if (token == "" || token == null) return context.go(ProofmasterRoute.auth);
    if (role == "STUDENT") return context.go(ProofmasterRoute.home);
    if (role == "TEACHER") return context.go(ProofmasterRoute.lecturerHome);
  }
}

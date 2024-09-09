import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/widgets/search_field.dart';

class TopBannerLecturerDashboard extends StatelessWidget {
  const TopBannerLecturerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 62.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Halo, Roni",
                style: CustomTextTheme.proofMasterTextTheme.displayLarge
                    ?.copyWith(color: Colors.white),
              ),
              GestureDetector(
                onTap: () {
                  // TODO: add route correctly
                  context.push(ProofmasterRoute.lecturerSettings);
                },
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/dumy_avatar.jpeg'),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SearchField(
                placeholder: "Cari nama mahasiswa", onValueChange: (roni) {}),
          )
        ],
      ),
    );
  }
}

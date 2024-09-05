import 'package:flutter/material.dart';
import 'package:proofmaster/app/domain/entities/student_item/student_item.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/widgets/setting_menu_item.dart';

class LecturerDashboardContent extends StatelessWidget {
  final List<StudentItem> items;
  const LecturerDashboardContent({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Mahasiswa",
                  style: CustomTextTheme.proofMasterTextTheme.bodyLarge),
            ],
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 16),
                itemCount: items.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: SettingMenuItem(
                        color: CustomColorTheme.colorBackground2,
                        text: items[index].name,
                        onTap: () {},
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}

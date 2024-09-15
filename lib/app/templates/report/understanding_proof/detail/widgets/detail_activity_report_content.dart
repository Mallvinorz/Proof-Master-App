import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/widgets/button.dart';
import 'package:proofmaster/widgets/textarea.dart';

class DetailActivityReportContent extends StatelessWidget {
  final String? studentId;
  const DetailActivityReportContent({super.key, this.studentId});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16.0,
        ),
        Material(
          elevation: 8.0,
          shape: const CircleBorder(),
          color: CustomColorTheme.colorBackground2,
          child: Container(
            padding: const EdgeInsets.all(40.0),
            width: 200,
            height: 200,
            child: Image.asset(
              "assets/icons/Paper.png",
              // fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        SizedBox(
          width: double.infinity,
          child: Button(
            onTap: () {},
            text:
                "Unduh file ${studentId == null || studentId == "" ? 'jawabanmu' : 'jawaban siswa'}",
            suffixIcon: const Icon(
              FontAwesomeIcons.solidFilePdf,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Commentar(readOnly: studentId == "")
      ],
    );
  }
}

class Commentar extends StatelessWidget {
  final bool readOnly;
  const Commentar({super.key, required this.readOnly});

  @override
  Widget build(BuildContext context) {
    return readOnly
        ? Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Review Jawabanmu:",
                        style: CustomTextTheme.proofMasterTextTheme.bodyLarge
                            ?.copyWith(color: Colors.grey)),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur .",
                      style: CustomTextTheme.proofMasterTextTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Dikirim pada: 2/12/2012",
                        style: CustomTextTheme.proofMasterTextTheme.bodySmall
                            ?.copyWith(color: Colors.grey),
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Komentar:",
                  style: CustomTextTheme.proofMasterTextTheme.bodyLarge
                      ?.copyWith(color: Colors.grey)),
              const TextArea(
                label: 'Review Jawaban',
                placeholder: 'Masukkan review anda',
              ),
              SizedBox(
                  width: double.infinity,
                  child: Button(onTap: () {}, text: "Simpan review jawaban"))
            ],
          );
  }
}

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';

class FilePickerPdf extends StatefulWidget {
  final Function(FilePickerResult?) onPickFile;
  const FilePickerPdf({super.key, required this.onPickFile});

  @override
  State<FilePickerPdf> createState() => _FilePickerPdfState();
}

class _FilePickerPdfState extends State<FilePickerPdf> {
  String? _filename;
  Future<FilePickerResult?> handlePickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    setState(() {
      _filename = result?.files[0].name;
    });
    widget.onPickFile(result);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final textColor = CustomTextTheme.proofMasterTextTheme.bodyMedium
        ?.copyWith(
            color: _filename == null
                ? CustomColorTheme.colorPrimary
                : Colors.white);
    return Expanded(
      child: Material(
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: CustomColorTheme.colorPrimary, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(32))),
        color: _filename == null
            ? const Color(0xFFE6E9FF)
            : const Color(0xFF7582FB),
        child: InkWell(
          onTap: handlePickFile,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.filePdf,
                    color: _filename != null
                        ? Colors.white
                        : CustomColorTheme.colorPrimary,
                    size: 32,
                  ),
                  const SizedBox(height: 8),
                  _filename != null
                      ? Column(
                          children: [
                            Text(
                                textAlign: TextAlign.center,
                                _filename.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textColor?.copyWith(fontSize: 12)),
                            Text(
                                textAlign: TextAlign.center,
                                "tap area ini jika ingin mengganti ulang jawaban",
                                style: textColor)
                          ],
                        )
                      : Text("Pilih file (Pdf) jawaban anda",
                          textAlign: TextAlign.center, style: textColor),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

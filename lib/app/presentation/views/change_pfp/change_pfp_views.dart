import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/domain/entities/change_pfp_dto/changepfpdto.dart';
import 'package:proofmaster/app/presentation/providers/user_provider/user_provider.dart';
import 'package:proofmaster/app/presentation/templates/background_pattern.dart';
import 'package:proofmaster/app/presentation/widgets/alert_dialog.dart';
import 'package:proofmaster/app/presentation/widgets/button.dart';
import 'package:proofmaster/app/presentation/widgets/error_handler.dart';
import 'package:proofmaster/app/presentation/widgets/shimmer_loader.dart';
import 'package:proofmaster/theme/color_theme.dart';

class ChangePfpView extends ConsumerStatefulWidget {
  const ChangePfpView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChangePfpViewState();
}

class _ChangePfpViewState extends ConsumerState<ChangePfpView> {
  Uint8List? _imgBytes;
  PlatformFile? _imgFile;
  bool _isLoading = false;

  Future<FilePickerResult?> handlePickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpeg', 'jpg'],
      withData: true,
    );

    setState(() {
      _imgBytes = result?.files[0].bytes;
      _imgFile = result?.files[0];
    });
    // widget.onPickFile(result);
    return result;
  }

  void setLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double imgSize = 320.0;
    final user = ref.watch(userProvider);
    final isRefreshing = ref.watch(isRefreshingProvider);

    return BackgroundPattern(
      usePatternBg: false,
      onTapNavBack: () => context.pop(),
      appBarTitle: "Foto profil",
      mainChildren: isRefreshing
          ? const _loader()
          : user.when(
              data: (data) => Stack(alignment: Alignment.center, children: [
                    SizedBox(
                      width: imgSize,
                      height: imgSize,
                      child: Stack(
                        children: [
                          _imgBytes == null
                              ? CircleAvatar(
                                  radius: imgSize,
                                  backgroundImage:
                                      NetworkImage(data.data?.photoUrl ?? ""),
                                )
                              : CircleAvatar(
                                  radius: imgSize,
                                  backgroundImage: MemoryImage(_imgBytes!),
                                ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              iconSize: 24,
                              padding: const EdgeInsets.all(12),
                              style: const ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                CustomColorTheme.colorPrimary,
                              )),
                              onPressed: () async {
                                await handlePickFile();
                              },
                              icon: const Icon(
                                FontAwesomeIcons.pencil,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    _buildActionButtons()
                  ]),
              error: (error, _) => ErrorHandler(
                  errorMessage: "$error",
                  action: () => ref.read(userProvider.notifier).refresh()),
              loading: () => const _loader()),
    );
  }

  Widget _buildActionButtons() {
    return _imgFile != null
        ? Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Button(
                        isDisabled: _isLoading,
                        onTap: () {
                          setState(() {
                            _imgBytes = null;
                          });
                        },
                        text: "Batalkan perubahan",
                        isOutlined: true),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Button(
                        onProgress: _isLoading,
                        isDisabled: _isLoading || _imgFile == null,
                        onTap: () async {
                          try {
                            setLoading(true);
                            if (_imgFile == null) return;
                            final ChangePfpDto changePfpDto =
                                ChangePfpDto(imageFile: File(_imgFile!.path!));
                            // print(changePfpDto.imageFile);
                            await ref
                                .read(userProvider.notifier)
                                .updatePfpProfile(changePfpDto);
                            final newUserState = ref.refresh(userProvider);

                            alertDialog(
                                context: context,
                                message: 'Foto profil berhasil diubah!',
                                title: 'Berhasil mengubah foto profil!',
                                isSuccess: true,
                                actionWidgets: [
                                  TextButton(
                                      onPressed: () {
                                        context.pop();
                                      },
                                      child: const Text("Tutup"))
                                ]);
                            setState(() {
                              if (newUserState is AsyncData) {
                                _imgFile = null;
                              }
                            });
                          } catch (e) {
                            alertDialog(
                                context: context,
                                message: 'Error: $e',
                                title:
                                    'Error saat unggah perubahan foto profil!',
                                isSuccess: false,
                                actionWidgets: [
                                  TextButton(
                                      onPressed: () {
                                        context.pop();
                                      },
                                      child: const Text("Tutup"))
                                ]);
                          } finally {
                            setLoading(false);
                          }
                        },
                        text: "Simpan perubahan"),
                  ),
                ],
              ),
            ),
          )
        : SizedBox.fromSize();
  }
}

class _loader extends StatelessWidget {
  const _loader();

  @override
  Widget build(BuildContext context) {
    const double imgSize = 320.0;
    return Stack(
      alignment: Alignment.center,
      children: [
        const ShimmerLoader(
          isLoading: true,
          child: CircleAvatar(
            radius: imgSize,
            backgroundImage: AssetImage("assets/images/dumy_avatar.jpeg"),
          ),
        ),
        ShimmerLoader(
          isLoading: true,
          child: IconButton(
              iconSize: 48,
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.pencil,
                color: Colors.white,
              )),
        )
      ],
    );
  }
}

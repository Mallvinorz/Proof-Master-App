import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/presentation/providers/student_provider/student_provider.dart';
import 'package:proofmaster/app/presentation/providers/user_provider/user_provider.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/app/presentation/widgets/error_handler.dart';
import 'package:proofmaster/app/presentation/widgets/search_field.dart';
import 'package:proofmaster/app/presentation/widgets/shimmer_loader.dart';

class TopBannerLecturerDashboard extends ConsumerWidget {
  const TopBannerLecturerDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final isRefreshing = ref.watch(isRefreshingProvider);

    return Padding(
      padding: const EdgeInsets.only(bottom: 48.0, top: 62.0),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          width: double.infinity,
          child: isRefreshing
              ? const _loaderContent()
              : user.when(
                  data: (data) => _content(
                      onSearch: (value) =>
                          ref.read(studentsProvider.notifier).search(value),
                      name: data.data?.name ?? "-",
                      imgUrl: data.data?.photoUrl),
                  error: (error, _) => ErrorHandler(
                      errorMessage: "$error",
                      action: () {
                        ref.read(userProvider.notifier).refresh();
                      }),
                  loading: () => const _loaderContent())),
    );
  }
}

// ignore: camel_case_types
class _content extends StatelessWidget {
  final String name;
  final String? imgUrl;
  final Function(String) onSearch;
  const _content(
      {super.key, required this.name, required this.onSearch, this.imgUrl});

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
                "Halo, $name",
                style: CustomTextTheme.proofMasterTextTheme.displayLarge
                    ?.copyWith(color: Colors.white),
              ),
              GestureDetector(
                  onTap: () {
                    context.push(ProofmasterRoute.lecturerSettings);
                  },
                  child: imgUrl == null
                      ? const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/dumy_avatar.jpeg'))
                      : CircleAvatar(
                          backgroundImage: NetworkImage(imgUrl!),
                        )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SearchField(
                placeholder: "Cari nama mahasiswa", onValueChange: onSearch),
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _loaderContent extends StatelessWidget {
  const _loaderContent({
    super.key,
  });

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
              ShimmerLoader(
                isLoading: true,
                child: Container(
                  color: Colors.white,
                  width: 200,
                  height: 32,
                ),
              ),
              const ShimmerLoader(
                isLoading: true,
                child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/dumy_avatar.jpeg')),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ShimmerLoader(
              isLoading: true,
              child: SearchField(
                  placeholder: "Cari nama mahasiswa", onValueChange: (roni) {}),
            ),
          )
        ],
      ),
    );
  }
}

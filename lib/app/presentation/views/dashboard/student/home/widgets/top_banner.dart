import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proofmaster/app/presentation/providers/user_provider/user_provider.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/app/presentation/widgets/error_handler.dart';
import 'package:proofmaster/app/presentation/widgets/shimmer_loader.dart';

class TopBannerHome extends ConsumerWidget {
  const TopBannerHome({super.key});

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
                      name: data.data?.name ?? "-",
                      imageUrl: data.data?.photoUrl),
                  error: (error, _) => ErrorHandler(
                      errorMessage: "$error",
                      action: () {
                        ref.read(userProvider.notifier).refresh();
                      }),
                  loading: () => const _loaderContent())),
    );
  }
}

class _content extends StatelessWidget {
  final String name;
  final String? imageUrl;
  const _content({super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Halo, $name",
              style: CustomTextTheme.proofMasterTextTheme.displayLarge
                  ?.copyWith(color: Colors.white),
            ),
            imageUrl == null
                ? const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/dumy_avatar.jpeg'))
                : CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl!),
                  )
          ],
        ),
        Text(
          "Yuk selesaikan progresmu!",
          style: CustomTextTheme.proofMasterTextTheme.displaySmall
              ?.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}

class _loaderContent extends StatelessWidget {
  const _loaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
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
        ShimmerLoader(
          isLoading: true,
          child: Container(
            color: Colors.white,
            width: 160,
            height: 12,
          ),
        ),
      ],
    );
  }
}

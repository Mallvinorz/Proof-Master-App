import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proofmaster/app/presentation/templates/background_pattern.dart';
import 'package:proofmaster/app/presentation/widgets/error_handler.dart';
import 'package:proofmaster/app/presentation/widgets/shimmer_loader.dart';

class ListItemTemplateAsyncvalue<T> extends ConsumerWidget {
  final AsyncValue<List<T>> asyncData;
  final void Function() onRefresh;
  final String title;
  final Widget? Function(T data) child;
  final bool useContainerBg;
  final Widget Function() shimmerLoaderChild;
  final Widget? topChild;
  final int? numLoadingChild;

  const ListItemTemplateAsyncvalue({
    super.key,
    required this.title,
    required this.child,
    required this.asyncData,
    required this.shimmerLoaderChild,
    required this.onRefresh,
    this.useContainerBg = false,
    this.topChild,
    this.numLoadingChild = 2,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const BorderRadius containerBorderRadius =
        BorderRadius.only(topRight: Radius.circular(29));

    return BackgroundPattern(
      borderRadius: containerBorderRadius,
      appBarTitle: title,
      topChildren: topChild,
      mainChildren: asyncData.when(
        loading: () => ListView.builder(
          padding: const EdgeInsets.only(top: 18),
          itemCount: numLoadingChild,
          itemBuilder: (ctx, index) =>
              ShimmerLoader(isLoading: true, child: shimmerLoaderChild()),
        ),
        error: (error, stack) => ErrorHandler(
          errorMessage: error.toString(),
          action: onRefresh,
        ),
        data: (items) => RefreshIndicator(
          onRefresh: () async {
            onRefresh();
          },
          child: Container(
            padding: useContainerBg ? const EdgeInsets.all(16) : null,
            decoration: useContainerBg
                ? const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12)))
                : null,
            child: items.isEmpty
                ? const Center(
                    child: Text(
                    "Belum ada data",
                  ))
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 18),
                    itemCount: items.length,
                    itemBuilder: (ctx, index) => child(items[index]),
                  ),
          ),
        ),
      ),
    );
  }
}

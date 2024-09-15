import 'package:flutter/material.dart';
import 'package:proofmaster/app/presentation/templates/background_pattern.dart';
import 'package:proofmaster/app/utils/ui_state.dart';
import 'package:proofmaster/app/presentation/widgets/error_handler.dart';

class ListItemTemplate<T> extends StatefulWidget {
  final Future<UIState<List<T>>> futureData;
  final Function onLoadData;
  final String title;
  final Widget? Function(T data) child;
  final bool useContainerBg;
  const ListItemTemplate({
    super.key,
    required this.title,
    required this.child,
    required this.futureData,
    required this.onLoadData,
    this.useContainerBg = false,
  });

  @override
  State<ListItemTemplate<T>> createState() => _ListItemTemplateState<T>();
}

class _ListItemTemplateState<T> extends State<ListItemTemplate<T>> {
  @override
  void initState() {
    super.initState();
    widget.onLoadData();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    // ignore: no_leading_underscores_for_local_identifiers
    const BorderRadius _containerBorderRadius =
        BorderRadius.only(topRight: Radius.circular(29));

    return BackgroundPattern(
      borderRadius: _containerBorderRadius,
      appBarTitle: widget.title,
      mainChildren: FutureBuilder<UIState<List<T>>>(
        future: widget.futureData,
        builder: (buildContext, snapshot) => !snapshot.hasData
            ? const Text("No data")
            : switch (snapshot.data) {
                UIInitial<List<T>>() => const Text("No data"),
                UILoading<List<T>>() => const CircularProgressIndicator(),
                UISuccess<List<T>>(data: final items) => Container(
                    padding:
                        widget.useContainerBg ? const EdgeInsets.all(16) : null,
                    decoration: widget.useContainerBg
                        ? const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(12)))
                        : null,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 18),
                      itemCount: items.length,
                      itemBuilder: (ctx, index) => widget.child(items[index]),
                    ),
                  ),
                UIError<List<T>>(message: final msg) =>
                  ErrorHandler(errorMessage: msg, action: () {}),
                _ => const Text("No data"),
              },
      ),
    );
  }
}

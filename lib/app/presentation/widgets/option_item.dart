import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';

class OptionItem<T> extends StatefulWidget {
  final bool selected;
  final String text;
  final T value;
  final Function(T) onSelected;
  const OptionItem(
      {super.key,
      required this.selected,
      required this.text,
      required this.value,
      required this.onSelected});

  @override
  State<OptionItem<T>> createState() => _OptionItemState<T>();
}

class _OptionItemState<T> extends State<OptionItem<T>> {
  bool onFinishLoad = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
            color:
                widget.selected ? CustomColorTheme.colorPrimary : Colors.grey,
            width: 1),
      ),
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => widget.onSelected(widget.value),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!onFinishLoad) const Text("Memuat konten..."),
              Flexible(
                child: TeXView(
                  renderingEngine: const TeXViewRenderingEngine.katex(),
                  onRenderFinished: (height) {
                    setState(() {
                      onFinishLoad = true;
                    });
                  },
                  child: TeXViewDocument(
                    widget.text,
                    style: widget.selected
                        ? const TeXViewStyle.fromCSS('font-weight: bold;')
                        : const TeXViewStyle.fromCSS('font-weight: normal'),
                  ),
                  // text,
                  // style: selected
                  //     ? CustomTextTheme.proofMasterTextTheme.bodyLarge
                  //     : CustomTextTheme.proofMasterTextTheme.bodyMedium,
                ),
              ),
              Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: widget.selected
                          ? CustomColorTheme.colorPrimary
                          : Colors.grey),
                  shape: BoxShape.circle,
                ),
                child: widget.selected
                    ? Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.selected
                              ? CustomColorTheme.colorPrimary
                              : Colors.transparent,
                        ),
                      )
                    : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}

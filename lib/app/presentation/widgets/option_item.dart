import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:proofmaster/theme/color_theme.dart';
import 'package:proofmaster/theme/text_theme.dart';

class OptionItem<T> extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
            color: selected ? CustomColorTheme.colorPrimary : Colors.grey,
            width: 1),
      ),
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => onSelected(value),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: TeXView(
                  child: TeXViewDocument(
                    text,
                    style: selected
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
                      color: selected
                          ? CustomColorTheme.colorPrimary
                          : Colors.grey),
                  shape: BoxShape.circle,
                ),
                child: selected
                    ? Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selected
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

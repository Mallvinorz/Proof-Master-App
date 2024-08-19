import 'package:flutter/material.dart';
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
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => onSelected(value),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: selected
                    ? proofMasterTextTheme.bodyLarge
                    : proofMasterTextTheme.bodyMedium,
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

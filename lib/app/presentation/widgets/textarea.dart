import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
  final String placeholder;
  final String? label;
  final String? errorText;
  final TextEditingController? controller;
  final Function(String)? onChange;
  const TextArea({
    super.key,
    required this.placeholder,
    this.errorText,
    this.label,
    this.onChange,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              label!,
            ),
          ),
        TextField(
            controller: controller,
            maxLines: 8, //or null
            onChanged: (value) => onChange != null ? onChange!(value) : null,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              errorText: errorText,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              hintText: placeholder,
            )),
      ],
    );
  }
}

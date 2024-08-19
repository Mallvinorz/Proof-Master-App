import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Input extends StatefulWidget {
  final String placeholder;
  final InputType inputType;
  String? label;
  Input(
      {super.key,
      required this.placeholder,
      required this.inputType,
      this.label});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool _peekPassword = false;

  void togglePeekPassword() {
    setState(() {
      _peekPassword = !_peekPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              widget.label!,
            ),
          ),
        TextField(
            obscureText: !_peekPassword,
            keyboardType: switch (widget.inputType) {
              InputType.password => TextInputType.visiblePassword,
              InputType.email => TextInputType.emailAddress,
              _ => TextInputType.text
            },
            decoration: InputDecoration(
              suffixIcon: widget.inputType == InputType.password
                  ? GestureDetector(
                      onTap: togglePeekPassword,
                      child: Icon(!_peekPassword
                          ? Icons.remove_red_eye
                          : FontAwesomeIcons.eyeSlash),
                    )
                  : null,
              prefixIcon: Icon(switch (widget.inputType) {
                InputType.email => Icons.email_rounded,
                InputType.name => Icons.person_2_outlined,
                InputType.fullname => Icons.person_outlined,
                InputType.password => Icons.lock_outline_rounded,
              }),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              hintText: widget.placeholder,
            )),
      ],
    );
  }
}

enum InputType { name, fullname, email, password }

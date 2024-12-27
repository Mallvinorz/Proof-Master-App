import 'package:flutter/material.dart';

class BuildContextProvider {
  BuildContext? _context;

  void setContext(BuildContext context) {
    _context = context;
  }

  BuildContext? getContext() {
    return _context;
  }
}

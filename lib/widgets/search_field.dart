import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchField extends StatefulWidget {
  final String placeholder;
  final Function(String) onValueChange;
  const SearchField(
      {super.key, required this.placeholder, required this.onValueChange});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    print(_searchController.text.isEmpty);
    // setState(() {
    //   // This empty setState will trigger a rebuild
    // });
    widget.onValueChange(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: _searchController,
        decoration: InputDecoration(
          suffixIcon: _searchController.text.isEmpty
              ? const Icon(FontAwesomeIcons.magnifyingGlass)
              : GestureDetector(
                  onTap: () {
                    _searchController.clear();
                  },
                  child: const Icon(FontAwesomeIcons.close),
                ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          hintText: widget.placeholder,
        ));
  }
}

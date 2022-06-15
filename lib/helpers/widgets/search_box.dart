import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shortcut_test_project/helpers/constants.dart';

class SearchBox extends StatefulWidget {
  final Function(String) editingCallback;
  const SearchBox({Key? key, required this.editingCallback}) : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final searchQuery = TextEditingController();
  final textFieldFocusNode = FocusNode();
  bool isFocused = false;
  String _oldText = "";
  Timer? _debounce;

  _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 600), () {
      if (_oldText != searchQuery.text) {
        widget.editingCallback(searchQuery.text);
        _oldText = searchQuery.text;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    textFieldFocusNode.addListener(_onFocusChange);
    searchQuery.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    textFieldFocusNode.removeListener(_onFocusChange);
    searchQuery.removeListener(_onSearchChanged);
    searchQuery.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      isFocused = textFieldFocusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.fromLTRB(6, 6, 6, 6),
      child: TextField(
        focusNode: textFieldFocusNode,
        controller: searchQuery,
        maxLines: 1,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: kTextColor, width: 1.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: kSecondaryColor, width: 1.0),
          ),
          hintText: 'Search by number',
          prefixIcon: Icon(
            Icons.search,
            color: isFocused ? kSecondaryColor : kTextColor,
          ),
        ),
      ),
    );
  }
}

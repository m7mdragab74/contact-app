import 'package:flutter/material.dart';

class ContactTextField extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;

  const ContactTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      onChanged: onChanged,
    );
  }
}

import 'package:flutter/material.dart';

class ContactImage extends StatelessWidget {
  final String url;

  const ContactImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 130,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Image.network(url, fit: BoxFit.fill),
    );
  }
}

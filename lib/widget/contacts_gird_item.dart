import 'package:contact_app/widget/update_delete_contant.dart';
import 'package:flutter/material.dart';
import '../models/db_model.dart';
import 'contact_image.dart';

class ContactsGridItem extends StatelessWidget {
  final Contact contact;

  const ContactsGridItem({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UpdateDelete(contact: contact),
        ));
      },
      child: Column(
        children: [
          ContactImage(url: contact.imgUrl),
          Text(
            contact.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            contact.phone,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

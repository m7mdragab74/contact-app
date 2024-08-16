import 'package:flutter/material.dart';
import '../models/db_model.dart';
import 'contacts_gird_item.dart';

class ContactsGrid extends StatelessWidget {
  final List<Contact> contacts;

  const ContactsGrid({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        crossAxisCount: 2,
      ),
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        Contact contact = contacts[index];
        return ContactsGridItem(contact: contact);
      },
    );
  }
}

import 'package:contact_app/widget/save_botton.dart';
import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import '../models/db_model.dart';
import 'contact_text_field.dart';

class AddContactSheet extends StatefulWidget {
  const AddContactSheet({super.key});

  @override
  State<AddContactSheet> createState() => _AddContactSheetState();
}

class _AddContactSheetState extends State<AddContactSheet> {
  String? name;
  String? phone;
  String? img;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0).copyWith(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Form(
          child: Column(
            children: [
              ContactTextField(
                hintText: 'Contact Name',
                onChanged: (val) => name = val,
              ),
              ContactTextField(
                hintText: 'Phone Number',
                onChanged: (val) => phone = val,
              ),
              ContactTextField(
                hintText: 'Img Url',
                onChanged: (val) => img = val,
              ),
              const SizedBox(height: 15),
              SaveButton(
                onSave: () async {
                  if (name == null || phone == null || img == null) {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill all the fields'),
                      ),
                    );
                  } else {
                    Contact contact = Contact(
                      name: name!,
                      phone: phone!,
                      imgUrl: img!,
                    );
                    try {
                      await DbHelper().insertContact(contact);
                      Navigator.of(context).pop();
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $e')),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

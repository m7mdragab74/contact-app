import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/db_model.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;
  DbHelper.internal();

  static Database? _db;

  Future<Database> createDatabase() async {
    if (_db != null) {
      return _db!;
    }

    String path = join(await getDatabasesPath(), 'contact.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE contacts(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, phone TEXT, imgUrl TEXT)');
      },
    );

    return _db!;
  }

  Future<int> insertContact(Contact contact) async {
    Database db = await createDatabase();
    return await db.insert('contacts', contact.toMap());
  }

  Future<List<Contact>> getContacts() async {
    Database db = await createDatabase();
    List<Map<String, dynamic>> result = await db.query('contacts');
    return result.map((contact) => Contact.fromMap(contact)).toList();
  }

  Future<int> deleteContact(int id) async {
    Database db = await createDatabase();
    return await db.delete('contacts', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateContact(Contact contact) async {
    Database db = await createDatabase();
    return await db.update('contacts', contact.toMap(),
        where: 'id = ?', whereArgs: [contact.id]);
  }
}

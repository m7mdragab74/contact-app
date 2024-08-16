class Contact {
  int? id;
  String name;
  String phone;
  String imgUrl;

  Contact({this.id, required this.name, required this.phone, required this.imgUrl});

  Map<String, dynamic> toMap() {
    var map = {
      'id': id,
      'name': name,
      'phone': phone,
      'imgUrl': imgUrl,
    };
    return map;
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      imgUrl: map['imgUrl'],
    );
  }
}

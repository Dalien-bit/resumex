import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../functions/function.dart';
import '../models/models.dart';

class Database {
  final _db = FirebaseFirestore.instance;
  final uid = UserModel().id;
  final userDoc =
      FirebaseFirestore.instance.collection('users').doc(UserModel().id);
  final detailsCol = FirebaseFirestore.instance
      .collection('users')
      .doc(UserModel().id)
      .collection('details');

  // CollectionReference<Map<String, dynamic>> get detailsCol => _detailsCol;

  addUser(User user) {
    final data = <String, dynamic>{
      'name': user.displayName,
      'phonenumber': user.phoneNumber,
      'email': user.email,
      'id': user.uid,
    };
    _db
        .collection('users')
        .doc(user.uid)
        .set(data)
        .then((value) => dprint('User saved'));
  }

  updateContact(Contact contact) {
    final data = contact.toMap();
    userDoc.collection('details').doc('contact').set(data);
  }

  Contact getContact() {
    Contact contact = Contact(name: '', email: '', phoneNumber: '');
    userDoc.collection('details').doc('contact').get().then((value) {
      contact.name = value['name'] ?? '';
      contact.phoneNumber = value['phonenumber'] ?? '';
      contact.email = value['email'] ?? '';
      contact.province = value['province'] ?? '';
      contact.city = value['city'] ?? '';
      contact.country = value['country'] ?? '';
    });
    return contact;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Api {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static FirebaseAuth auth = FirebaseAuth.instance;

  static User get users => auth.currentUser!;

  static Future<bool> userExist() async {
    return (await firestore.collection('users').doc(users.uid).get()).exists;
  }
}

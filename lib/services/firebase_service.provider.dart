import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseServiceProvider {
  static final FirebaseServiceProvider _instance =
      FirebaseServiceProvider._internal();

  factory FirebaseServiceProvider() {
    return _instance;
  }

  FirebaseServiceProvider._internal();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
}

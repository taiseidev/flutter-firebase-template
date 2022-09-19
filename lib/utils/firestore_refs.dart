import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_template/models/app_user.dart';

final db = FirebaseFirestore.instance;

DocumentReference<AppUser> appUserRef({required String userId}) =>
    appUsersRef.doc(userId);

final appUsersRef = db.collection('users').withConverter<AppUser>(
      fromFirestore: (snapshot, _) => AppUser.fromDocumentSnapshot(snapshot),
      toFirestore: (obj, _) => obj.toJson(),
    );

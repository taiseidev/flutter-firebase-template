import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Stream<User?> get authState;
  Future<void> signIn();
  Future<UserCredential> signUp();
  Future<void> signOut();
  User getCurrentUser();
}

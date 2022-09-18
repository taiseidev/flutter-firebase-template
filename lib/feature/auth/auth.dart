import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (_) => throw UnimplementedError(),
);

// ユーザーのログイン状態を監視
final authStateChangesProvider =
    StreamProvider<User?>((ref) => ref.watch(authProvider).authState);

final authProvider = Provider<Auth>((ref) => Auth(ref.read));

class Auth {
  Auth(this._read);
  final Reader _read;

  Stream<User?> get authState => _read(firebaseAuthProvider).authStateChanges();

  User getCurrentUser() {
    throw UnimplementedError();
  }

  Future<void> signIn() {
    throw UnimplementedError();
  }

  Future<void> signOut() {
    throw UnimplementedError();
  }

  Future<UserCredential> signUp(Future<UserCredential> Function() signUp) {
    try {
      return signUp();
    } on Exception catch (_) {
      throw Error();
    }
  }
}

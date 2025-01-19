import 'package:event_app/features/auth/data/models/auth_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository(this._firebaseAuth);

  Future<User?> getCurrentUser() async {
    return _firebaseAuth.currentUser;
  }

  Future<Either<AuthFailure, User>> login(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(userCredential.user!);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  Future<void> logout() async {
    print('logout');
    await _firebaseAuth.signOut();
    print('_firebaseAuth.currentUser ${_firebaseAuth.currentUser?.uid}');
  }
}

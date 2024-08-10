import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_pharmacy/features/auth/data/models/user_model.dart';
import 'package:my_pharmacy/features/auth/data/repo/auth_repo_abstract.dart';

class AuthRepoImplementation implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> signUp(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserModel> signIn(String email, String password) async {
    final UserCredential userCredential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredential.user;

    if (user != null) {
      return getUserInfo(user.uid);
    } else {
      throw Exception("Failed to sign in");
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> updateUserInfo(UserModel user) async {
    await _firestore.collection('users').doc(user.id).update(user.toJson());
  }

  @override
  Future<UserModel> getUserInfo(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();
    if (doc.exists) {
      return UserModel.fromJson(doc.data()!);
    } else {
      throw Exception("User not found");
    }
  }

  @override
  @override
  Future<void> confirmPasswordReset(String otp, String newPassword) async {
    try {
      await _firebaseAuth.confirmPasswordReset(
          code: otp, newPassword: newPassword);
    } catch (e) {
      throw Exception('Failed to reset password: $e');
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception('Failed to send password reset email: $e');
    }
  }
  
  
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_pharmacy/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<User> signUp(String email, String password);
  Future<UserModel> signIn(String email, String password);
  Future<void> updateUserInfo(UserModel user);
    Future<void> addUser(UserModel user);

  Future<UserModel> getUserInfo(String userId);

  Future<void> signOut();
  Future<void> sendPasswordResetEmail(String email);
  Future<void> confirmPasswordReset(String otp, String newPassword);
}

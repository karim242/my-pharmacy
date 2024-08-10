import 'package:my_pharmacy/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<void> signUp(String email, String password);
  Future<UserModel> signIn(String email, String password);
  Future<void> updateUserInfo(UserModel user);
  Future<UserModel> getUserInfo(String userId);
  Future<void> signOut();
}

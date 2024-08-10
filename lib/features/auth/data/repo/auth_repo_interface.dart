import 'package:my_pharmacy/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> signInWithEmail(String email, String password);
  Future<void> signOut();
  Future<void> signUp(String email, String password);
}

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_pharmacy/features/auth/data/models/user_model.dart';
import 'package:my_pharmacy/features/auth/data/repo/auth_repo_interface.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  UserModel? currentUser;

  AuthCubit(this.authRepository) : super(AuthInitial());
  Future<void> signIn(String email, String password) async {
    emit(SignInLoadingState());
    try {
      final userCredential = await authRepository.signIn(email, password);
      final user = await authRepository.getUserInfo(userCredential.id);

      emit(SignInSuccessState(user: user));
    } on FirebaseAuthException catch (e) {
      _sigInHandelException(e);
    } catch (e) {
      emit(SignInFailureState(errMessage: e.toString()));
    }
  }

  Future<void> signUp(
    String email,
    String password,
    String name,
    String phone,
    String address,
  ) async {
    emit(SignUpLoadingState());
    try {
      await authRepository.signUp(email, password);
      final user = await authRepository.signIn(email, password);
      currentUser = user;
      final updatedUser = UserModel(
        id: user.id,
        name: name,
        email: user.email,
        phoneNumber: phone,
        address: address,
      );
      await authRepository.updateUserInfo(updatedUser);
      emit(SignUpSuccessState(user: updatedUser));
    } on FirebaseAuthException catch (e) {
      _sigUpHandelException(e);
    } catch (e) {
      SignUpFailureState(errMessage: e.toString());
    }
  }

  Future<void> updateUserInfo(
    String name,
    String phone,
    String address,
  ) async {
    if (currentUser == null) {
      emit(UserInfoUpdateFailureState(errMessage: "User not signed in"));
      return;
    }
    try {
      final updatedUser = UserModel(
        id: currentUser!.id,
        name: name,
        email: currentUser!.email,
        phoneNumber: phone,
        address: address,
      );
      await authRepository.updateUserInfo(updatedUser);
      currentUser = updatedUser;
      emit(UserInfoUpdateSuccessState(user: updatedUser));
    } catch (e) {
      emit(UserInfoUpdateFailureState(errMessage: e.toString()));
    }
  }

  void _sigUpHandelException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(
          SignUpFailureState(errMessage: 'The password provided is too weak.'));
    } else if (e.code == 'email-already-in-use') {
      emit(SignUpFailureState(
          errMessage: 'The account already exists for that email'));
    } else if (e.code == 'invalid-email') {
      emit(SignUpFailureState(errMessage: 'The email is invalid'));
    } else {
      emit(SignUpFailureState(errMessage: e.code));
    }
  }

  void _sigInHandelException(FirebaseAuthException e) {
    if (e.code == 'user-not-found') {
      emit(SignInFailureState(errMessage: "No user found for that email"));
    } else if (e.code == 'wrong-password') {
      emit(SignInFailureState(
          errMessage: 'Wrong password provided for that user'));
    } else {
      emit(SignInFailureState(errMessage: "Check your email and password"));
    }
  }
}

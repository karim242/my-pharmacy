import 'package:bloc/bloc.dart';
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
}

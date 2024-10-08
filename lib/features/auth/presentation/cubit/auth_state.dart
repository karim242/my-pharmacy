part of 'auth_cubit.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpLoadingState extends AuthState {}

final class SignUpSuccessState extends AuthState {
  final UserModel user;

  SignUpSuccessState({required this.user});
}

final class SignUpFailureState extends AuthState {
  final String errMessage;

  SignUpFailureState({required this.errMessage});
}

final class TermsAndConditionsUpdateState extends AuthState {}

final class ObscurePasswordTextUpdateState extends AuthState {}

final class SignInLoadingState extends AuthState {}

final class SignInSuccessState extends AuthState {
  final UserModel user;

  SignInSuccessState({required this.user});
}

final class SignInFailureState extends AuthState {
  final String errMessage;

  SignInFailureState({required this.errMessage});
}

final class UserInfoUpdateLoadingState extends AuthState {}

final class UserInfoUpdateSuccessState extends AuthState {
  final UserModel user;

  UserInfoUpdateSuccessState({required this.user});
}

final class UserInfoUpdateFailureState extends AuthState {
  final String errMessage;

  UserInfoUpdateFailureState({required this.errMessage});
}

final class EmailVerificationLoadingState extends AuthState {}

final class EmailVerificationSuccessState extends AuthState {}

final class EmailVerificationFailureState extends AuthState {
  final String errMessage;

  EmailVerificationFailureState({required this.errMessage});
}

final class PasswordResetEmailLoadingState extends AuthState {}

final class PasswordResetEmailSuccessState extends AuthState {}

final class PasswordResetEmailFailureState extends AuthState {
  final String errMessage;

  PasswordResetEmailFailureState({required this.errMessage});
}

final class PasswordResetConfirmLoadingState extends AuthState {}

final class PasswordResetConfirmSuccessState extends AuthState {}

final class PasswordResetConfirmFailureState extends AuthState {
  final String errMessage;

  PasswordResetConfirmFailureState({required this.errMessage});
}

final class AuthUnauthenticated extends AuthState {}

final class AuthError extends AuthState {
  final String error;

  AuthError(this.error);
}

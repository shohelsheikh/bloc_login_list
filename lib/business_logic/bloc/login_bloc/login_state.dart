part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class OtpLoading extends LoginState {}

class OtpLoaded extends LoginState {
  final Otp? otp;

  OtpLoaded({required this.otp});
}

class OtpFailed extends LoginState {}

class VerifyOtpLoading extends LoginState {}

class VerifyOtpLoaded extends LoginState {
  final LoginCheck? loginCheck;

  VerifyOtpLoaded({required this.loginCheck});
}

class VerifyOtpFailed extends LoginState {}

part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class GetOTP extends LoginEvent {
  final String mobileNo;

  GetOTP({required this.mobileNo});
}

class VerifyLogin extends LoginEvent {
  final String mobileNo;
  final String token;

  VerifyLogin({required this.mobileNo, required this.token});
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:module1/data/dataproviders/network/api_call.dart';
import 'package:module1/data/model/login_check.dart';
import 'package:module1/data/model/otp.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is GetOTP) {
      yield OtpLoading();
      Otp? otp = await Api.getOTP(event.mobileNo);
      if (otp == null) {
        yield OtpFailed();
      } else if (otp.status == "1") {
        yield OtpLoaded(otp: otp);
      }
    }

    if (event is VerifyLogin) {
      yield VerifyOtpLoading();
      LoginCheck? loginCheck =
          await Api.verifyLogin(event.token, event.mobileNo);
      if (loginCheck == null) {
        yield VerifyOtpFailed();
      } else if (loginCheck.status == "1") {
        yield VerifyOtpLoaded(loginCheck: loginCheck);
      }
    }
  }
}

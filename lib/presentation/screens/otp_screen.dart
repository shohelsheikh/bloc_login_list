import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module1/business_logic/bloc/login_bloc/login_bloc.dart';
import 'package:module1/business_logic/bloc/product_list_bloc/productlist_bloc.dart';
import 'package:module1/presentation/screens/product_list_screen.dart';
import 'package:timer_count_down/timer_count_down.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key, required this.mobileNo}) : super(key: key);

  String mobileNo;
  static const token = 'ffdfsf4sd5f4sd5f4s5f45';
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('otp'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            LoginBloc bloc = BlocProvider.of<LoginBloc>(context);
            Widget childWidget = Container();
            if (state is OtpLoading) {
              childWidget = const CircularProgressIndicator();
            }
            if (state is OtpLoaded) {
              childWidget = Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("OTP Sent to $mobileNo"),
                  TextField(
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: "OTP"),
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(4),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      if (state.otp!.otp == otpController.text) {
                        bloc.add(
                          VerifyLogin(
                            token: token,
                            mobileNo: mobileNo,
                          ),
                        );
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => ProductlistBloc(),
                                child: ProductListScreen(
                                  mobileNo: mobileNo,
                                ),
                              ),
                            ),
                            (Route<dynamic> route) => false);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please Enter Valid OTP'),
                          ),
                        );
                      }
                    },
                    child: const Text('Verify'),
                  ),
                  Countdown(
                    seconds: 30,
                    build: (BuildContext context, double time) => time != 0.0
                        ? Text(time.toString())
                        : TextButton(
                            onPressed: () {
                              bloc.add(GetOTP(mobileNo: mobileNo));
                            },
                            child: const Text('resend'),
                          ),
                    interval: const Duration(milliseconds: 100),
                  )
                ],
              );
            }
            if (state is OtpFailed) {
              childWidget = TextButton(
                onPressed: () {
                  bloc.add(GetOTP(mobileNo: mobileNo));
                },
                child: const Text('resend'),
              );
            }
            return childWidget;
          },
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module1/business_logic/bloc/login_bloc/login_bloc.dart';
import 'screens.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mobileController = TextEditingController();

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/userImage.jpeg",
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: mobileController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "MobileNo"),
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
              ),
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                LoginBloc bloc = BlocProvider.of<LoginBloc>(context);
                return TextButton(
                  onPressed: () {
                    bloc.add(
                      GetOTP(mobileNo: mobileController.text),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider.value(
                          value: bloc,
                          child: OtpScreen(mobileNo: mobileController.text),
                        ),
                      ),
                    );
                  },
                  child: const Text('Login'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module1/business_logic/bloc/login_bloc/login_bloc.dart';
import 'package:module1/business_logic/bloc/product_list_bloc/productlist_bloc.dart';
import 'package:module1/presentation/screens/product_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'presentation/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SharedPreferences prefs;
  String? token;
  String? mobileNo;

  @override
  void initState() {
    super.initState();
    initVariables();
  }

  void initVariables() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    mobileNo = prefs.getString("mobile_no");
    setState(() {});
    // prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: token != null
          ? BlocProvider(
              create: (context) => ProductlistBloc(),
              child: ProductListScreen(mobileNo: mobileNo),
            )
          : BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(),
              child: LoginScreen(),
            ),
    );
  }
}

// To parse this JSON data, do
//
//     final loginCheck = loginCheckFromJson(jsonString);

import 'dart:convert';

LoginCheck loginCheckFromJson(String str) => LoginCheck.fromJson(json.decode(str));

String loginCheckToJson(LoginCheck data) => json.encode(data.toJson());

class LoginCheck {
  LoginCheck({
    this.status,
    this.msg,
    this.userId,
  });

  final String? status;
  final String? msg;
  final String? userId;

  factory LoginCheck.fromJson(Map<String, dynamic> json) => LoginCheck(
    status: json["status"],
    msg: json["msg"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "user_id": userId,
  };
}

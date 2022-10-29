import 'dart:convert';

Otp otpFromJson(String str) => Otp.fromJson(json.decode(str));

String otpToJson(Otp data) => json.encode(data.toJson());

class Otp {
  Otp({
    this.status,
    this.msg,
    this.otp,
  });

  final String? status;
  final String? msg;
  final String? otp;

  factory Otp.fromJson(Map<String, dynamic> json) => Otp(
        status: json["status"],
        msg: json["msg"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "otp": otp,
      };
}

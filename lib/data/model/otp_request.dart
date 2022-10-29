/// dial_code : "+91"
/// mobile_no : "8983320073"

class Otp_request {
  Otp_request({
      String? dialCode, 
      String? mobileNo,}){
    _dialCode = dialCode;
    _mobileNo = mobileNo;
}

  Otp_request.fromJson(dynamic json) {
    _dialCode = json['dial_code'];
    _mobileNo = json['mobile_no'];
  }
  String? _dialCode;
  String? _mobileNo;


  set dialCode(String value) {
    _dialCode = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dial_code'] = _dialCode;
    map['mobile_no'] = _mobileNo;
    return map;
  }

  set mobileNo(String value) {
    _mobileNo = value;
  }
}
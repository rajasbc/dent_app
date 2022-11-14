import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:niglabs/LoginScreen/modal/userdata.dart';
// import 'MessageText.dart' as Message;
import 'UrlPath.dart' as RequestPath;
import 'package:fluttertoast/fluttertoast.dart';

_setHeaders(access_token) => {
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $access_token'
    };
_setHeadersWithOutToken() => {
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };

class api {
  userLoginResponse(data) async {
    String loginUrl = RequestPath.base_url + RequestPath.userLogin;
    var response = await http.post(Uri.parse(loginUrl),
        body: jsonEncode(data), headers: _setHeadersWithOutToken());
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
    return json.decode(response.body);
    }
  }
}
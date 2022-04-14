import 'dart:io';

import 'package:flutter/material.dart';

bool validateEmail(String? value) {
  // Regex for email validation
  var p = '[a-zA-Z0-9\+\.\_\%\-\+]{1,256}'
      '\\@'
      '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}'
      '('
      '\\.'
      '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}'
      ')+';
  var regExp = RegExp(p);
  if (value != null && regExp.hasMatch(value)) {
    return true;
  }
  return false;
}

bool validatePassword(String? value) {
  print(value != null && value.isNotEmpty);
  if (value != null && value.isNotEmpty) return true;
  return false;
}

Future mockLogin({required String? email, required String? password}) async {
  await Future.delayed(const Duration(seconds: 2), () {
    if (email == 'mail@domain.com' && password == 'Password1') {
      return;
    } else {
      throw Exception('Worng password or email');
    }
  });
}

Future<UserInfo> login({required String email, required String password}) async {
  await Future.delayed(const Duration(seconds: 1));
  return UserInfo(email: email, loginTime: DateTime.now());
}

//format datetime to dd/MM/yyyy hh:mm:ss
String formatDateTime(DateTime dateTime) {
  return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
}

bool isDarkMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

class UserInfo {
  String email;
  DateTime loginTime;
  UserInfo({required this.email, required this.loginTime});
}

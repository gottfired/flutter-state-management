import 'dart:io';

import 'package:flutter/material.dart';

String? validateEmail(String? value) {
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
    return null;
  }
  return 'Incorrect Email';
}

String? validatePassword(String? value) {
  // Regex for password validation
  var p = '^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}\$';
  var regExp = RegExp(p);
  if (value != null && regExp.hasMatch(value)) {
    return null;
  }
  return 'Must contain at least 8 characters, upper- and lowercase letters and a number';
}

Color HexaColor(String strcolor, {int opacity = 15}) {
  //opacity is optional value
  strcolor = strcolor.replaceAll("#", ""); //replace "#" with empty value
  String stropacity =
      opacity.toRadixString(16); //convert integer opacity to Hex String
  return Color(int.parse("$stropacity$stropacity" + strcolor, radix: 16));
  //here color format is 0xFFDDDDDD, where FF is opacity, and DDDDDD is Hex Color
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

//enum Challanges { bodyLanguage, voice, innerPosture, communication }

abstract class Challange {
  String name;
  Color color;
  Challange({required this.name, required this.color});
}

class BodyLanguage extends Challange {
  BodyLanguage() : super(name: 'Körpersprache', color: Color(0xff876EE6));
}

class Voice extends Challange {
  Voice() : super(name: 'Stimme & Sprache', color: Color(0xffFF3259));
}

class InnerPosture extends Challange {
  InnerPosture() : super(name: 'Innere Haltung', color: Color(0xff3481D7));
}

class Communication extends Challange {
  Communication()
      : super(name: 'Kommunikation & Rethorik', color: Color(0xffFFD255));
}

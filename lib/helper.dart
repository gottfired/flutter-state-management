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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimony_app/utils/colors.dart';
import 'package:matrimony_app/utils/fonts.dart';

bool validatePassword(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
}

var passwordVText = 'Password must have at least 8 characters and contain at least two of following: uppercase letter,lowercase letter,numbers and symbols.';
var serverError='server error';

showMsg(String text) {
  return Get.snackbar(
    null,
    '',
    messageText: Text(
      '$text',
      style: AppFonts.primaryFont(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
      ),
    ),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.black,
  );
}

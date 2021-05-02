import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matrimony_app/utils/fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController tc;
  final String hint;
  final keyboard;
  final secure;
  final iconsspre;
  final iconssend;

  final Function myFunc;

  CustomTextField(this.hint, this.tc, this.keyboard, this.secure,
      this.iconsspre, this.iconssend, this.myFunc);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppFonts.primaryFont(
        fontSize: 16,
        color: Colors.black87,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
      ),
      keyboardType: keyboard,
      obscureText: secure,
      decoration: InputDecoration(
        hintText: hint,
        labelText: hint,
        hintStyle: AppFonts.primaryFont(
          fontSize: 16,
          // color: Colors.black,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
        ),
        labelStyle: AppFonts.primaryFont(
          fontSize: 16,
          // color: Colors.black,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
        ),
        // alignLabelWithHint: true,
        // filled: true,
        fillColor: Colors.black87,
        // prefixIcon: iconsspre,
//          suffixIcon:
        suffixIcon: IconButton(icon: iconssend, onPressed: myFunc),
        contentPadding: EdgeInsets.only(left: 22,),
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(12.0),
          ),
        ),
      ),
      controller: tc,
    );
  }
}

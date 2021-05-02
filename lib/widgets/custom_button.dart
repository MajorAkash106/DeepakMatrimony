import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:matrimony_app/utils/fonts.dart';

class CustomButton extends StatefulWidget {
 final Function function;
 final String text;
  CustomButton(this.function,this.text);
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:widget.function,
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: <Color>[
              HexColor('#FCAE91'),
              HexColor('#FD8B8C'),
              HexColor('#FF5584'),
            ],
          ),
        ),
        padding: const EdgeInsets.fromLTRB(24, 15, 24, 15),
        child:  Center(child: Text('${widget.text}', style: AppFonts.primaryFont(
          fontSize:22,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ))),
      ),
    );
  }
}

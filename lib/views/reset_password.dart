import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:matrimony_app/utils/colors.dart';
import 'package:matrimony_app/utils/fonts.dart';
import 'package:matrimony_app/utils/images.dart';
import 'package:matrimony_app/views/login_screen.dart';
import 'package:matrimony_app/views/signup_screen.dart';
import 'package:matrimony_app/widgets/custom_button.dart';
import 'package:matrimony_app/widgets/custom_textfield.dart';

class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  bool _obscureText = true;
  var emailUsrname = TextEditingController();
  void _toggle() {
    print('ok');
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(25),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  SvgPicture.asset(
                    AppImages.primaryLogo,
                  ),
                  Text(
                    'Reset Password',
                    style: AppFonts.primaryFont(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      // fontStyle: FontStyle.,
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),
                  CustomTextField(
                      'Password',
                      emailUsrname,
                      TextInputType.emailAddress,
                      _obscureText,
                      Icon(Icons.security),
                      _obscureText == true
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      _toggle),
                  SizedBox(
                    height: 40,
                  ),

                  CustomTextField(
                      'Confirm Password',
                      emailUsrname,
                      TextInputType.emailAddress,
                      _obscureText,
                      Icon(Icons.security),
                      _obscureText == true
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      _toggle),
                  SizedBox(
                    height: 40,
                  ),


                  CustomButton(() {
                    print('helo');
                  },'Reset Password'),
                  SizedBox(
                    height: 20,
                  ),


                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      new Text("Already have an account? ",
                          style: AppFonts.primaryFont(
                            fontSize: 14,
                            color: Colors.black26,
                            fontWeight: FontWeight.bold,
                          )),
                      GestureDetector(
                        onTap: () {
                          Get.to(()=>LoginScreen());
                        },
                        child: new Text('Sign In',
                            style: AppFonts.primaryFont(
                              fontSize: 14,
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  )
                ],
              ))),
    );
  }
}

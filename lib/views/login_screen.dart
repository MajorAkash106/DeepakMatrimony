import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:matrimony_app/controllers/login_controller.dart';
import 'package:matrimony_app/utils/colors.dart';
import 'package:matrimony_app/utils/fonts.dart';
import 'package:matrimony_app/utils/images.dart';
import 'package:matrimony_app/views/forgot_password.dart';
import 'package:matrimony_app/views/home/bottom_navigation_bar.dart';
import 'package:matrimony_app/views/signup_screen.dart';
import 'package:matrimony_app/widgets/custom_button.dart';
import 'package:matrimony_app/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = LoginController();
  bool _obscureText = true;
  var emailUsrname = TextEditingController();
  var pass = TextEditingController();
  void _toggle() {
    print('ok');
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){},
      child: Scaffold(
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
                      'Sign In',
                      style: AppFonts.primaryFont(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 26,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        // fontStyle: FontStyle.,
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                        'Email/Username',
                        emailUsrname,
                        TextInputType.emailAddress,
                        false,
                        Icon(null),
                        Icon(null),
                        null),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                        'Password',
                        pass,
                        TextInputType.emailAddress,
                        _obscureText,
                        Icon(Icons.security),
                        _obscureText == true
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        _toggle),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        GestureDetector(
                          onTap: () {
                           Get.to(()=>ForgotScreen());
                          },
                          child: new Text('Forgot password ?',
                              style: AppFonts.primaryFont(
                                fontSize: 14,
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // _isloading
                    //     ? SpinKitHourGlass(
                    //         color: statuscolor,
                    //         size: 40.0,
                    //       )
                    //     : SizedBox(),
                    CustomButton(() {
                      print('helo');
                      _loginController.apiCall(emailUsrname.text, pass.text);
                    },'Sign In'),
                    SizedBox(
                      height: 20,
                    ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                    ),
                    Text('OR',style:  AppFonts.primaryFont(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    ),),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
                    SizedBox(
                      height: 20,
                    ),
                    OutlineButton(
                      onPressed: () {
                        _loginController.googleLogin();
                      },
                     shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),

                        // this effects to FlatButton and RaisedButton
                        side: BorderSide(
                          color: Colors.white, //Color of the border
                          style: BorderStyle.solid, //Style of the border
                          width: 1, //width of the border
                        ),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              AppImages.googleLogo,
                              height: 35,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Sign In with Google",style: AppFonts.primaryFont(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            ),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        new Text("Don't have an account? ",
                            style: AppFonts.primaryFont(
                              fontSize: 14,
                              color: Colors.black26,
                              fontWeight: FontWeight.bold,
                            )),
                        GestureDetector(
                          onTap: () {
                            Get.to(()=>SignupScreen());
                          },
                          child: new Text('Sign up',
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
      ),
    );
  }
}

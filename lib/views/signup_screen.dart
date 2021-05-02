import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matrimony_app/controllers/signup_controller.dart';
import 'package:matrimony_app/utils/colors.dart';
import 'package:matrimony_app/utils/fonts.dart';
import 'package:matrimony_app/utils/images.dart';
import 'package:matrimony_app/views/forgot_password.dart';
import 'package:matrimony_app/views/login_screen.dart';
import 'package:matrimony_app/widgets/custom_button.dart';
import 'package:matrimony_app/widgets/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final SignupController _signupController = SignupController();
  bool _obscureText = true;
  bool _obscureText2 = true;
  var name = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();
  var pass = TextEditingController();
  var pass2 = TextEditingController();

  void _toggle() {
    print('ok');
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggle2() {
    print('ok');
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

  int _groupValue = -1;

  File _image;
  final picker = ImagePicker();
  Future getImageCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        Get.back();
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        Get.back();
      } else {
        print('No image selected.');
      }
    });
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
//          title: new Text("Alert Dialog title"),
          content: Row(
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(
                onPressed: getImageCamera,
                child: Text('From Camera'),
              ),
              SizedBox(
                width: 5,
              ),
              RaisedButton(
                onPressed: getImageGallery,
                child: Text('From Gallery'),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(25),
              width: Get.width,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
//                   Container(
//                       width: 120.0,
//                       height: 120.0,
//                       decoration: new BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: new DecorationImage(
//                             fit: BoxFit.cover,
//                             image: _image==null? NetworkImage(
//                                 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8WfepgJmnY7X3g-QWLC7VNdpZTPLr6UYHE6_m9GVzR2xb6tdsHg&s'):new FileImage(_image)
//                         ),
// //                      borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
//                         border: new Border.all(
//                           color: primaryColor,
//                           width: 2.0,
//                         ),
//                       )),
//                   FlatButton(
//                     // splashColor: Colors.cyan,
//                     onPressed: _showDialog,
//                     child: new Text(
//                       'profile photo',
//                       style:
//                       AppFonts.primaryFont(
//                         fontSize: 20,
//                         color: Colors.blueAccent,
//                         decoration: TextDecoration.underline,
//                         fontWeight: FontWeight.bold,
//                       )
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),

                  SvgPicture.asset(
                    AppImages.primaryLogo,
                  ),
                  Text(
                    'Sign Up',
                    style: AppFonts.primaryFont(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      // fontStyle: FontStyle.,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  CustomTextField('Full Name', name, TextInputType.emailAddress,
                      false, Icon(null), Icon(null), null),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Gender',
                        style: AppFonts.primaryFont(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox()
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          _myRadioButton(
                            title: "Checkbox 0",
                            value: 0,
                            onChanged: (newValue) =>
                                setState(() => _groupValue = newValue),
                          ),
                          Text(
                            'Male',
                            style: AppFonts.primaryFont(
                              fontSize: 14,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          _myRadioButton(
                            title: "Checkbox 1",
                            value: 1,
                            onChanged: (newValue) =>
                                setState(() => _groupValue = newValue),
                          ),
                          Text(
                            'Female',
                            style: AppFonts.primaryFont(
                              fontSize: 14,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          _myRadioButton(
                            title: "Checkbox 1",
                            value: 2,
                            onChanged: (newValue) =>
                                setState(() => _groupValue = newValue),
                          ),
                          Text(
                            'Other',
                            style: AppFonts.primaryFont(
                              fontSize: 14,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField('Phone', phone, TextInputType.phone, false,
                      Icon(null), Icon(null), null),
                  SizedBox(
                    height: 20,
                  ),

                  CustomTextField('Email', email, TextInputType.emailAddress,
                      false, Icon(null), Icon(null), null),
                  SizedBox(
                    height: 20,
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
                    height: 20,
                  ),
                  CustomTextField(
                      'Confirm Password',
                      pass2,
                      TextInputType.emailAddress,
                      _obscureText2,
                      Icon(Icons.security),
                      _obscureText2 == true
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      _toggle2),

                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => ForgotScreen());
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
                  CustomButton(() {
                    _signupController.apiCall(name.text, _groupValue,
                        phone.text, email.text, pass.text, pass2.text,);
                  }, 'Sign Up'),
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
                          Get.to(() => LoginScreen());
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

  Widget _myRadioButton({String title, int value, Function onChanged}) {
    return Radio(
      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      // title: Text(title),
    );
  }
}

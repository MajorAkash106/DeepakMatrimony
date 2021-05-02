import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimony_app/utils/apis.dart';
import 'package:matrimony_app/utils/const.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:matrimony_app/utils/func.dart';
import 'package:matrimony_app/utils/request_api.dart';

import 'package:matrimony_app/utils/request_api.dart.dart';
import 'package:matrimony_app/views/home/bottom_navigation_bar.dart';

class SignupController extends GetxController {
  void apiCall(
    String name,
    int gender,
    String phone,
    String email,
    String password,
    String password2,
  ) async {
    print('signup api call');
    print(gender);

    if (name.isNotEmpty) {
      if (gender != -1) {
        if (phone.isNotEmpty) {
          if (phone.length == 10) {
            if (email.isNotEmpty) {
              if (EmailValidator.validate(email)) {
                if (password.isNotEmpty) {
                  if (password2.isNotEmpty) {
                    print(validatePassword(password));
                    if (validatePassword(password)) {
                      if (validatePassword(password2)) {
                        if (password == password2) {
                          checkInternet().then((Internet) {
                            print(Internet);
                            if (Internet == true) {
                              Map data = {
                                'fullName': name,
                                'gender': gender==0?"Male":gender==2?"Other":"Female",
                                'phone': phone,
                                'email': email,
                                'password': password,
                                'password_confirmation': password2,
                              };
                              print(data);
                              Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
                              Request request =
                                  Request(apiurl: ApiUrl.signupApi, body: data);
                              request.post().then((value) {
                                var decodedData = json.decode(value.body);
                                print(decodedData);
                                Get.back();
                                if(decodedData['status'].toString() == 200.toString()){
                                  Get.to(()=>BottomBarScreen());
                                  showMsg(decodedData['message']);
                                }else{
                                  showMsg(decodedData['message']);
                                }


                              }).catchError((onError) {
                                print('server error: $onError');
                                Get.back();
                                showMsg(serverError);
                              });
                            }
                          });
                        } else {
                          //  both pass should b same
                          showMsg('Both password should be same');
                        }
                      } else {
                        //  weak pass2
                        showMsg(passwordVText);
                      }
                    } else {
                      //  weak pass
                      showMsg(passwordVText);
                    }
                  } else {
                    //  enter pass2
                    showMsg('Please enter confirm phone');
                  }
                } else {
                  //  enter pass
                  showMsg('Please enter your password');
                }
              } else {
                //  invalid email
                showMsg('Please enter a valid email');
              }
            } else {
              //  enter email
              showMsg('Please enter your email');
            }
          } else {
            //  enter 10 digit phone
            showMsg('Please enter 10 digits phone number');
          }
        } else {
          showMsg('Please enter your phone');
        }
      } else {
        //  select gender
        showMsg('Please select gender');
      }
    } else {
      showMsg('Please enter name');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

}

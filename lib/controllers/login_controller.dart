import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:matrimony_app/utils/apis.dart';
import 'package:matrimony_app/utils/const.dart';
import 'package:matrimony_app/utils/func.dart';
import 'package:matrimony_app/utils/request_api.dart';
import 'package:matrimony_app/views/home/bottom_navigation_bar.dart';

class LoginController extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future apiCall(String emailOrUsername, String password) {
    if (emailOrUsername.isNotEmpty) {
      if (password.isNotEmpty) {
        if (validatePassword(password)) {


          checkInternet().then((Internet) {
            print(Internet);
            if (Internet == true) {
              Map data = {
                'email': emailOrUsername,
                'password': password,
              };
              print(data);
              Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
              Request request =
              Request(apiurl: ApiUrl.loginApi, body: data);
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
          showMsg(passwordVText);
        }
      } else {
        showMsg('Please enter password');
      }
    } else {
      showMsg('Please enter email or username');
    }
  }

  Future googleLogin() async {
    checkInternet().then((Internet) {
      print(Internet);
      if (Internet==true) {
        try {
          _googleSignIn.signIn();

          print("email: ${_googleSignIn.currentUser.email}");
          print("name: ${_googleSignIn.currentUser.displayName}");
          _googleSignIn.signOut();
        } catch (err) {
          print(err);
        }
      }
    });
  }
}

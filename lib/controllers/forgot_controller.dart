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

class ForgotController extends GetxController {
  void apiCall(
    String email,
  ) async {
    print('forgot api call');

    if (email.isNotEmpty) {


      checkInternet().then((Internet) {
        print(Internet);
        if (Internet == true) {
          Map data = {
            'email': email,
          };
          print(data);
          Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
          Request request =
          Request(apiurl: ApiUrl.forgotPass, body: data);
          request.post().then((value) {
            var decodedData = json.decode(value.body);
            print(decodedData);
            Get.back();
            if(decodedData['status'].toString() == 200.toString()){
              // Get.to(()=>BottomBarScreen());
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
      showMsg('Please enter email or username');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}

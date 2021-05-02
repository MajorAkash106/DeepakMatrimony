import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:matrimony_app/utils/const.dart';

Future<bool> checkInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  showMsg('No Internet Connection');
  return false;
}
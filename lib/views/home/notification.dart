import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimony_app/views/login_screen.dart';
class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: RaisedButton(child: Text('Logout'),onPressed: (){
        Get.to(()=>LoginScreen());
      },),),
    );
  }
}

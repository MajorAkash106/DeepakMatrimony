import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimony_app/views/login_screen.dart';
import 'package:matrimony_app/views/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

Map<int, Color> color = {
  50: Color.fromRGBO(255, 92, 87, .1),
  100: Color.fromRGBO(255, 92, 87, .2),
  200: Color.fromRGBO(255, 92, 87, .3),
  300: Color.fromRGBO(255, 92, 87, .4),
  400: Color.fromRGBO(255, 92, 87, .5),
  500: Color.fromRGBO(255, 92, 87, .6),
  600: Color.fromRGBO(255, 92, 87, .7),
  700: Color.fromRGBO(255, 92, 87, .8),
  800: Color.fromRGBO(255, 92, 87, .9),
  900: Color.fromRGBO(255, 92, 87, 1),
};

MaterialColor colorCustom = MaterialColor(0xFFFF5083, color);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      title: 'Flutter Demo',
      color: Colors.red,
      theme: ThemeData(
          primarySwatch: colorCustom,
          accentColor: colorCustom
      ),
      home: SplashScreen(),
    );
  }
}

import 'package:easy_apps/Get_User_Status.dart';
import 'package:easy_apps/Screens/Home%20Screen.dart';
import 'package:easy_apps/Screens/Intro%20Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => {
  runApp(const Splash_Screen())
  });
}

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}


class _Splash_ScreenState extends State<Splash_Screen> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //appBar: AppBar(
         // backgroundColor: Colors.white,
         // title: Center(child: Text("Easy Apps",style: TextStyle(color: Colors.black,
         // ),)),
        //),
        body: AnimatedSplashScreen(
            splashTransition: SplashTransition.fadeTransition,
            duration: 8000,
            splashIconSize: 250,
            splash: Image.asset("assets/Easy Apps Logo.png",) , nextScreen:Get_User_Stats()),
      ),
    );
  }
}

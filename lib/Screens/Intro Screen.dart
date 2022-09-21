
import 'dart:async';
import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_apps/Screens/Help%20&%20Support.dart';
import 'package:easy_apps/Screens/Login_Page.dart';
import 'package:easy_apps/Screens/Sign%20In%20Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Intro_Screen extends StatefulWidget {
  const Intro_Screen({Key? key}) : super(key: key);

  @override
  State<Intro_Screen> createState() => _Intro_ScreenState();
}

class _Intro_ScreenState extends State<Intro_Screen> {

  bool isLoading = false;

  int _currentPage = 0;
  late Timer _timer;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(seconds: 1),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: [

            Stack(
              children: [



              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: SafeArea(
                  child: Container(
                    height: 60,
                    width: 60,
                    child: Image.asset("assets/Easy Apps.png",fit: BoxFit.cover,),
                  )),
            ),
          PageView(
            controller: _pageController,
            physics: AlwaysScrollableScrollPhysics(),
            children: [
              Center(child: Image.asset("assets/Saves Your Time.png"),),
              Center(child: Image.asset("assets/Quality.jpg"),),
              Center(child: Image.asset("assets/Build Your App More safely and securly.png"),),
              Center(child: Image.asset("assets/Each Screen in Just.png"),)
            ],
          ),

            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            isLoading = true;
                          });
                          Future.delayed(Duration(seconds: 4),(){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)  => Sign_In_Page()));
                          });

                        },
                        child: Container(
                          height: 60,
                          width: 350,
                          child: Center(
                            child: isLoading
                          ? SpinKitSpinningLines(color: Colors.black)
                          : Text("CONTINUE",style: TextStyle(letterSpacing: 2,fontSize: 18)
                          ) ,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.all(Radius.circular(4))
                          ),
                        ),
                      ),
                    )
                )),
            Padding(
              padding: const EdgeInsets.only(right: 70,top: 11),
              child: Align(
                  alignment: Alignment.topRight,
                  child: SafeArea(child:

                  InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login_Page()));
                      },
                      child: Container(child: Text("Log In",style: TextStyle(fontSize: 20,color: Colors.blue),))))),
            ),

            Align(
                alignment: Alignment.topRight,
                child: SafeArea(child: TextButton(onPressed: (){
                  Help_And_Support(context);
                  print("Help Function Called.. !");
                }, child: Text("Help",style: TextStyle(color: Colors.black),)))),

          ]
    ),
      ),
    );
  }
}

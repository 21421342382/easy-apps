import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/Home Screen.dart';
import 'Screens/Intro Screen.dart';



class Get_User_Stats extends StatefulWidget {
  const Get_User_Stats({Key? key}) : super(key: key);

  @override
  State<Get_User_Stats> createState() => _Get_User_StatsState();
}

class _Get_User_StatsState extends State<Get_User_Stats> {
  Get_User_Status()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final Login_Data = prefs.getString("Is_Logged_In");
    if(Login_Data == "True"){
      print("Navigated To Home Page");
      return Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home_Screen()));
    }else{
      print("Navigated To Intro Page");
      return Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Intro_Screen()));
    }
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Get_User_Status(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }else{
          if(snapshot.hasError){
            return Center(child: CircularProgressIndicator(),);
    }else {

    return Container();

          }
        }
      },
    );
  }
}

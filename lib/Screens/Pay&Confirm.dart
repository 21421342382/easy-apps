import 'package:easy_apps/Fetch%20Data.dart';
import 'package:easy_apps/Screens/Home%20Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class Pay_Confirm extends StatefulWidget {
  const Pay_Confirm({Key? key, this.logo, this.app_name, this.description, this.help_support_mail, this.credit, this.app_owner, required this.windows, required this.mac, required this.linux, required this.android, required this.apple, this.phone_number, this.contact_email, this.screen}) : super(key: key);

  final logo;
  final app_name;
  final description;
  final help_support_mail;
  final credit;
  final app_owner;
  final bool windows;
  final bool mac;
  final bool linux;
  final bool android;
  final bool apple;
  final phone_number;
  final contact_email;
  final screen;
  // /// /// /// /

  @override
  State<Pay_Confirm> createState() => _Pay_ConfirmState();
}

class _Pay_ConfirmState extends State<Pay_Confirm> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:Upload_User_Apps(context,widget.app_name, widget.app_owner, widget.android, widget.apple, widget.mac, widget.windows, widget.linux, widget.credit, widget.app_owner, widget.phone_number, widget.contact_email, widget.help_support_mail, widget.logo, widget.description, widget.screen, widget.screen+10, widget.screen*999),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting){
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Text("Payment Sucesfull",style: TextStyle(fontWeight: FontWeight.w300,letterSpacing: 2,fontSize: 34),)),
                      )),
                  SizedBox(height: 30,),
                  Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(80)),
                          color: Colors.greenAccent
                      ),
                      child: Center(child: SpinKitRing(color: Colors.blue,lineWidth: 3,),)
                    // Center(child: Icon(Icons.check,size: 55,color: Colors.redAccent,),),
                  )
                ],
              ),
            ),
          ),
        );
      }else if(snapshot.hasError){
        return Center(
          child: Text("An Error Occured .. Please Try Again Later"),
        ) ;
      }else{
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Text("Payment Sucesfull",style: TextStyle(fontWeight: FontWeight.w300,letterSpacing: 2,fontSize: 34),)),
                      )),
                  SizedBox(height: 30,),
                  Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(80)),
                          color: Colors.greenAccent
                      ),
                      child: Center(child: Icon(Icons.check,size: 55,color: Colors.redAccent,),)
                    // Center(child: Icon(Icons.check,size: 55,color: Colors.redAccent,),),
                  )
                ],
              ),
            ),
          ),
        );
      }

    },);

  }

}

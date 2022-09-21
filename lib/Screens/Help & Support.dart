import 'package:email_launcher/email_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

Help_And_Support(context){
  Alert(
    context: context,
    type: AlertType.info,
    title: "Contact us via",
    buttons: [
      DialogButton(
        child: Text(
          "Phone",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () async{
          var url = Uri.parse("tel:8409037655");
          if (await canLaunchUrl(url)) {
          await launchUrl(url);
          } else {
          throw 'Could not launch $url';
          }
        },
        color: Colors.purple,
        radius: BorderRadius.circular(10),
      ),
      DialogButton(
        child: Text(
          "Email",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: ()async{
          Email email = Email(
              to: ['letscodeindia384@gmail.com'],
              subject: 'Enter Your Subject',
              body: 'Enter Body'
          );
          await EmailLauncher.launch(email);
        },
        color: Color.fromRGBO(0, 179, 134, 1.0),
        radius: BorderRadius.circular(10),
      ),
    ],
  ).show();
}
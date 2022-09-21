

import 'dart:io';

import 'package:easy_apps/Screens/Account%20Page.dart';
import 'package:easy_apps/Screens/Home%20Screen.dart';
import 'package:easy_apps/Screens/Intro%20Screen.dart';
import 'package:easy_apps/Screens/Pay&Confirm.dart';
import 'package:easy_apps/Screens/Sign%20In%20Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Upload_User_Data(Name , Email , Password , context) async{
  final Database = await Db.create("mongodb+srv://EasyAppsAuthTokenVerification_User0001:u8duQEsEOrFk9TeS@cluster0.uzh4p41.mongodb.net/EasyApps?retryWrites=true&w=majority");
  await Database.open();
  final coll = Database.collection("EasyAppsDatabase");
  print(await coll.find(where.eq("Test Id", "01")).toList());
  await coll.insertOne({
    "Name" : Name , "Email" : Email , "Password" : Password, "PhotoURL" : "",
  });
  print(await coll.find().toList());
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove("Name");
  await prefs.remove("Email");
  await prefs.remove("Password");
  await prefs.remove("PhotoUrl");

  await prefs.setString("Name", Name);
  await prefs.setString("Email", Email);
  await prefs.setString("Password", Password);
  await prefs.setString("PhotoUrl", "");
  await prefs.setString("Is_Logged_In", "True");
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => Home_Screen()), (route) => false);
}
Check_Logged_In_User(Email , Password , context)async{
  final Database = await Db.create("mongodb+srv://EasyAppsAuthTokenVerification_User0001:u8duQEsEOrFk9TeS@cluster0.uzh4p41.mongodb.net/EasyApps?retryWrites=true&w=majority");
  await Database.open();
  final coll = Database.collection("EasyAppsDatabase");
  print("This is the Email - "+Email);
  final Check_Logged_User_Email = await coll.findOne(where.eq("Email", Email));
  final Check_Logged_User_Password = await coll.findOne(where.eq("Password", Password));
  print( "Check_for_Email -  "+'$Check_Logged_User_Email');
  print("Check_For_Password - "+ '$Check_Logged_User_Password');
  Database.close();
  if(Check_Logged_User_Password == null){
    return Alert(
      context: context,
      type: AlertType.error,
      title: "User Not Registered",
      desc: "User Not Registered. Please Create a New One",
      buttons: [
        DialogButton(
          child: Text(
            "Register",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Sign_In_Page())),
          width: 120,
        )
      ],
    ).show();

  }else{
    if(Check_Logged_User_Email == null){
      return Alert(
        context: context,
        type: AlertType.error,
        title: "User Not Registered",
        desc: "User Not Registered. Please Create a New One",
        buttons: [
          DialogButton(
            child: Text(
              "Register",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Sign_In_Page())),
            width: 120,
          )
        ],
      ).show();
    }else{
      final Database = await Db.create("mongodb+srv://EasyAppsAuthTokenVerification_User0001:u8duQEsEOrFk9TeS@cluster0.uzh4p41.mongodb.net/EasyApps?retryWrites=true&w=majority");
      await Database.open();
      final coll = Database.collection("EasyAppsDatabase");
      final name = await coll.findOne(where.eq("Password", Password));
      final Name = name!["Name"];
      print("This The The Name - " + '${Name}');
      SharedPreferences prefs   = await SharedPreferences.getInstance();
      await prefs.remove("Name");
      await prefs.remove("Email");
      await prefs.remove("Password");
      await prefs.remove("PhotoUrl");

      await prefs.setString("Name", '$Name');
      await prefs.setString("Email", Email);
      await prefs.setString("Password", Password);
      await prefs.setString("PhotoUrl", "");
      await prefs.setString("Is_Logged_In", "True");
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Home_Screen()), (route) => false);
    }
    }
    }

Get_User_Apps(context) async{
  final Database = await Db.create("mongodb+srv://EasyAppsAuthTokenVerification_User0001:u8duQEsEOrFk9TeS@cluster0.uzh4p41.mongodb.net/EasyApps?retryWrites=true&w=majority");
  await Database.open();
  final coll = Database.collection("EasyAppsUserApps");
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final User_Apps = await coll.findOne({"Owner" : prefs.getString("Name")});
  final coll2 = Database.collection("EasyAppsDatabase");
  print("Name = " + '${prefs.getString("Name")}');
  final UserProfile_Photo = await coll2.findOne(where.eq("Name", prefs.getString("Name")));
  print("This is The Data - " + await '${User_Apps}');
  if(await User_Apps == null){
    print("No Data Found ");
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => No_Data_Home_Screen(Name: prefs.getString("Name"),PhotoURL: UserProfile_Photo!["PhotoURL"],)));
  }else{
    Photo_Url.PhotoURL = User_Apps!["PhotoURL"] ;
    print("////////////////////////////////////////////////////////////////////////////");
    print(Photo_Url.PhotoURL);
    print("////////////////////////////////////////////////////////////////////////////");
    print(User_Apps["PhotoURL"]);
    print("Apps - " + '${User_Apps.length}');
    return User_Apps;
  }
}


Get_User_Apps_2(context) async{
  final Database = await Db.create("mongodb+srv://EasyAppsAuthTokenVerification_User0001:u8duQEsEOrFk9TeS@cluster0.uzh4p41.mongodb.net/EasyApps?retryWrites=true&w=majority");
  await Database.open();
  final coll = Database.collection("EasyAppsUserApps");
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final User_Apps = await coll.findOne({"Owner" : prefs.getString("Name")});
  final coll2 = Database.collection("EasyAppsDatabase");
  final UserProfile_Photo = await coll2.findOne(where.eq("Name", prefs.getString("Name")));
  print("This is The Data - " + await '${User_Apps}');
  if(await User_Apps == null){
    print("No Data Found ");
    return "No Data Found";
  }else{
    Photo_Url.PhotoURL = User_Apps!["PhotoURL"] ;
    print("Apps - " + '${User_Apps.length}');
    return "Data Found";
  }
}

Get_User_Name()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final name = prefs.getString("Name");
  return name;
}

Get_User_Data(Name)async{
  final Database = await Db.create("mongodb+srv://EasyAppsAuthTokenVerification_User0001:u8duQEsEOrFk9TeS@cluster0.uzh4p41.mongodb.net/EasyApps?retryWrites=true&w=majority");
  await Database.open();
  final coll = Database.collection("EasyAppsDatabase");
  print("UserName - " + Name);
  final User_Data = await coll.findOne(where.eq("Name", Name));
  print(await User_Data);
  return User_Data;
}

Upload_User_Profile_Photo(URL , context)async{
  final apps = await Get_User_Apps_2(context);
  final Database = await Db.create("mongodb+srv://EasyAppsAuthTokenVerification_User0001:u8duQEsEOrFk9TeS@cluster0.uzh4p41.mongodb.net/EasyApps?retryWrites=true&w=majority");
  await Database.open();
  final coll = Database.collection("EasyAppsDatabase");
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await coll.updateOne(where.eq('Name',prefs.getString("Name") ), modify.set('PhotoURL',URL ));
  print("Updated");
  await prefs.setString("PhotoURL", URL);
  if(apps == "No Data Found"){
    await coll.updateOne(where.eq('Name',prefs.getString("Name") ), modify.set('PhotoURL',URL ));
    return Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Home_Screen()), (route) => false);
  }else{
    final coll2 = Database.collection("EasyAppsUserApps");
    await coll2.update(where.eq('Owner',prefs.getString("Name") ), modify.set('PhotoURL',URL ));
    return Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Home_Screen()), (route) => false);
  }
}
Logout(context)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove("Name");
  await prefs.remove("Email");
  await prefs.remove("Password");
  await prefs.remove("PhotoUrl");
  await prefs.remove("Is_Logged_In");
  print("Returning To Home Screen");
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Intro_Screen()), (route) => false);
  //exit(0);
}

Update_Name(Name,context)async{
  final apps = await Get_User_Apps_2(context);
  final Database = await Db.create("mongodb+srv://EasyAppsAuthTokenVerification_User0001:u8duQEsEOrFk9TeS@cluster0.uzh4p41.mongodb.net/EasyApps?retryWrites=true&w=majority");
  await Database.open();
  final coll = Database.collection("EasyAppsDatabase");
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await coll.update(where.eq('Name',prefs.getString("Name") ), modify.set('Name',Name ));
  print("Updated");
  await prefs.setString("Name", Name);
  if(apps == "No Data Found"){
    return Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Home_Screen()), (route) => false);
  }else{
    final coll2 = Database.collection("EasyAppsUserApps");
    await coll2.update(where.eq('Owner',prefs.getString("Name") ), modify.set('Name',Name ));
    return Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Home_Screen()), (route) => false);
  }
}
Update_PhotoURL(PhotoURL)async{
  final Database = await Db.create("mongodb+srv://EasyAppsAuthTokenVerification_User0001:u8duQEsEOrFk9TeS@cluster0.uzh4p41.mongodb.net/EasyApps?retryWrites=true&w=majority");
  await Database.open();
  final coll = Database.collection("EasyAppsDatabase");
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await coll.updateOne(where.eq('Name',prefs.getString("Name") ), modify.set('PhotoURL',PhotoURL ));
  print("Done !!!!!");
  return "Updated";
}

Upload_User_Apps(context,App_Name,Name,Android,Apple,Mac,Windows,Linux,Credit,App_Owner,Phone_Number,Email,Help_Support_Email,App_Logo,App_Description,Screens,Days_To_Complete,Total_Cost) async{
  final Database_for_photo = await Db.create("mongodb+srv://EasyAppsAuthTokenVerification_User0001:u8duQEsEOrFk9TeS@cluster0.uzh4p41.mongodb.net/EasyApps?retryWrites=true&w=majority");
  await Database_for_photo.open();
  final coll_ = Database_for_photo.collection("EasyAppsDatabase");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final name = prefs.getString("Name");
  final User_Data = await coll_.findOne(where.eq("Name", name));

  final Database = await Db.create("mongodb+srv://EasyAppsAuthTokenVerification_User0001:u8duQEsEOrFk9TeS@cluster0.uzh4p41.mongodb.net/EasyApps?retryWrites=true&w=majority");
  await Database.open();
  final coll = Database.collection("EasyAppsUserApps");
  print("/////////////////////////////////////////////////////////////////////////////");
  print(User_Data!["PhotoURL"]);
  print("Uri - "+ "https://greeter-easyapps.herokuapp.com/?input=${prefs.getString("Name")}&app_name=${App_Name}&email_add=${Email}");
  http.get(Uri.parse("https://greeter-easyapps.herokuapp.com/?input=${prefs.getString("Name")}&app_name=${App_Name}&email_add=${Email}"));
  final document = {
    "App Name": App_Name,
    "Owner" : prefs.getString("Name"),
    "App Logo" : App_Logo,
    "App Description" : App_Description,
    "Credit" : Credit,
    "App Owner" : App_Owner,
    "Windows" : Windows,
    "Mac" : Mac,
    "Linux" : Linux,
    "Android" : Android,
    "Apple" : Apple,
    "Phone Number" : Phone_Number,
    "Email" : Email,
    "Help & Support Email" : Help_Support_Email,
    "Screens" : Screens,
    "Days To Complete" : Days_To_Complete,
    "Total Cost" : Total_Cost,
    "PhotoURL" : User_Data["PhotoURL"].toString().trim() == "" ?null :User_Data["PhotoURL"].toString().trim(),
    "Percent Complete" : 0.0,
    "Percent Complete Text" : 0,
    "Created_at" : '${"${DateTime.now().day}" + "-"+ "${DateTime.now().month}"+"-"+ "${DateTime.now().year}"}'
  };
  Photo_Url.PhotoURL = User_Data["PhotoURL"].toString().trim() == "" ?null :User_Data["PhotoURL"].toString().trim();
  coll.insertOne(document).then((value) => {
    print("Doc Updated"),
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Home_Screen()), (route) => false),
  });
}

Get_User_app_List()async{
  final Database = await Db.create("mongodb+srv://EasyAppsAuthTokenVerification_User0001:u8duQEsEOrFk9TeS@cluster0.uzh4p41.mongodb.net/EasyApps?retryWrites=true&w=majority");
  await Database.open();
  final coll = Database.collection("EasyAppsUserApps");
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final User_Apps = await coll.find({"Owner" : prefs.getString("Name")});
  print("This is The Data - " + await '${User_Apps}');
  return User_Apps.toList();
}

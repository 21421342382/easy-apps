import 'dart:convert';
import 'dart:io';
import 'package:easy_apps/Screens/About%20Us.dart';
import 'package:easy_apps/Screens/Help%20&%20Support.dart';
import 'package:easy_apps/Screens/Intro%20Screen.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:easy_apps/Fetch%20Data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:math' as math;

import 'Home Screen.dart';

class Account_Page extends StatefulWidget {
  const Account_Page({Key? key, this.Name}) : super(key: key);
final Name ;
  @override
  State<Account_Page> createState() => _Account_PageState();
}

class _Account_PageState extends State<Account_Page> {
  bool Show_Loader = false;
  bool show_loading = false;
  Future pickImage() async{
    await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Get_User_Data(widget.Name),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: SpinKitPouringHourGlass(color: Colors.redAccent,),);
          }else{
            return Container(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 400,),
                            child: Center(
                              child: InkWell(
                                onTap: (){Logout(context);},
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 80,
                                    width: 360,
                                    decoration: BoxDecoration(
                                        color: Colors.purple.shade100,
                                        border: Border.all(),
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Center(child: Text("Logout" ,style: GoogleFonts.kiteOne(fontSize: 34,letterSpacing: 3),),),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 50,),

                          Center(
                            child: InkWell(
                              onTap: (){
                                Help_And_Support(context);
                                //Help Page Navigation
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 80,
                                  width: 360,
                                  decoration: BoxDecoration(
                                      color: Colors.purple.shade100,
                                      border: Border.all(),
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Center(child: Text("Help & Support" ,style: GoogleFonts.kiteOne(fontSize: 34,letterSpacing: 3),),),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 50,),
                          Center(
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => About_Us()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 80,
                                  width: 360,
                                  decoration: BoxDecoration(
                                      color: Colors.purple.shade100,
                                      border: Border.all(),
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Center(child: Text("About Us" ,style: GoogleFonts.kiteOne(fontSize: 34,letterSpacing: 3),),),

                                ),
                              ),
                            ),
                          )
                        ]
                    ),
                  ),
                  SafeArea(child: snapshot.data["PhotoURL"] == ""
                          ? Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: GestureDetector(
                                onTap:()async{
                                  final pickedFile  = await ImagePicker().pickImage(source: ImageSource.gallery);
                                  if(pickedFile!=null){
                                    var _cmpressed_image;
                                    try {
                                      setState(() {
                                        Show_Loader = true;
                                      });
                                      _cmpressed_image = await FlutterImageCompress.compressWithFile(
                                          pickedFile.path,
                                          format: CompressFormat.heic,
                                          quality: 70

                                      );
                                      var decoded = base64Encode(_cmpressed_image);
                                      print("This Is The Decoded Image");
                                      Upload_User_Profile_Photo(decoded,context);
                                      Photo_Url.PhotoURL = decoded;
                                    } catch (e) {
                                      _cmpressed_image = await FlutterImageCompress.compressWithFile(
                                          pickedFile.path,
                                          format: CompressFormat.jpeg,
                                          quality: 70
                                      );
                                      var decoded = base64Encode(_cmpressed_image);
                                      print("This Is The Decoded Image");
                                      Upload_User_Profile_Photo(decoded, context);
                                      Photo_Url.PhotoURL = decoded;
                                    }
                                  }
                                } ,

                                child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(80)),
                                  border: Border.all()
                        ),
                                child: Show_Loader
                                ? SpinKitThreeBounce(color: Colors.blue,)
                                :const Center(child: Icon(Icons.add_a_photo,size: 55,)),
                                ),
                              ),
                            ),
                          )
                            : Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                        onTap: (){},
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(80)),
                              border: Border.all()
                          ),
                          child: Center(child: Stack(
                          children: <Widget>[
                                  const Center(child: CircularProgressIndicator()),
                                  InkWell(
                                    onTap: (){
                                      Alert(
                                        context: context,
                                        type: AlertType.warning,
                                        title: "Edit Profile",
                                        desc: "Do You Want To Edit Your Profile ?",
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "Yes",
                                              style: TextStyle(color: Colors.white, fontSize: 20),
                                            ),
                                            onPressed: () async{
                                              final pickedFile  = await ImagePicker().pickImage(source: ImageSource.gallery);
                                              if(pickedFile!=null){
                                                var _cmpressed_image;
                                                try {
                                                  setState(() {
                                                    Show_Loader = true;
                                                  });
                                                  _cmpressed_image = await FlutterImageCompress.compressWithFile(
                                                      pickedFile.path,
                                                      format: CompressFormat.heic,
                                                      quality: 70

                                                  );
                                                  var decoded = base64Encode(_cmpressed_image);
                                                  print("This Is The Decoded Image");
                                                  Upload_User_Profile_Photo(decoded , context);
                                                  Navigator.pop(context);
                                                } catch (e) {
                                                  _cmpressed_image = await FlutterImageCompress.compressWithFile(
                                                      pickedFile.path,
                                                      format: CompressFormat.jpeg,
                                                      quality: 70
                                                  );
                                                  var decoded = base64Encode(_cmpressed_image);
                                                  print("This Is The Decoded Image");
                                                  Upload_User_Profile_Photo(decoded , context);
                                                  Navigator.pop(context);
                                                }
                                              }
                                            },
                                            color: Color.fromRGBO(0, 179, 134, 1.0),
                                          ),
                                          DialogButton(
                                            child: Text(
                                              "No",
                                              style: TextStyle(color: Colors.white, fontSize: 20),
                                            ),
                                            onPressed: () => Navigator.pop(context),
                                            gradient: LinearGradient(colors: [
                                              Color.fromRGBO(116, 116, 191, 1.0),
                                              Color.fromRGBO(52, 138, 199, 1.0)
                                            ]),
                                          )
                                        ],
                                      ).show();
                                    },
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      child: Center(
                                       child:CircleAvatar(
                                          minRadius: 150,
                                          backgroundImage: MemoryImage(base64Decode(snapshot.data["PhotoURL"]))
                                        )
                                      ),



                                    ),
                                  )],
                                  ),
                                  ),),
                        ),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 255),
                        child: TextButton(

                          onPressed: () {
                            /*TextEditingController _name = new TextEditingController();
                            Alert(
                              context: context,
                              type: AlertType.warning,
                              title: "Edit Name",
                              desc: "Do You Want To Edit Your Name ?",
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () async{
                                    Alert(
                                        context: context,
                                        title: "Change Name",
                                        content: Column(
                                          children: <Widget>[
                                            TextFormField(
                                              maxLength: 17,
                                              controller: _name,
                                              decoration: InputDecoration(
                                                icon: Icon(Icons.account_circle),
                                                labelText: 'Name',
                                              ),
                                            ),

                                          ],
                                        ),
                                        buttons: [
                                          DialogButton(
                                            onPressed: () {
                                              if(_name.text == ''){
                                                print("Got No Name ");
                                                Navigator.pop(context);
                                              }else{
                                                print("Got Name "+ _name.text);
                                                setState(() {
                                                  show_loading = true;
                                                });
                                                Update_Name(_name.text, context);

                                              }
                                            },
                                            child: show_loading
                                                ? CircularProgressIndicator(color: Colors.black,)
                                                :Text(
                                              "Change",
                                              style: TextStyle(color: Colors.white, fontSize: 20),
                                            ),
                                          )
                                        ]).show();
                                  },
                                  color: Color.fromRGBO(0, 179, 134, 1.0),
                                ),
                                DialogButton(
                                  child: Text(
                                    "No",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(116, 116, 191, 1.0),
                                    Color.fromRGBO(52, 138, 199, 1.0)
                                  ]),
                                )
                              ],
                            ).show();*/
                          },
                          child: Text( snapshot.data["Name"],style: GoogleFonts.montserrat(fontSize: 34,color: Colors.black87),),

                        ),
                      )),
                  Align(
                    alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 300),
                        child: Text(snapshot.data["Email"],style: GoogleFonts.poppins(fontSize: 8),),
                      )),

                    Padding(
                     padding: EdgeInsets.only(top: 350),
                      child: Divider(color: Colors.black,),
                    )
                ,
                ]
              ),
            );
          }
        },),
    );
  }
}


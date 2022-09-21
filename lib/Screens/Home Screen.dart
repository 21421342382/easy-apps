import 'dart:convert';
import 'package:easy_apps/Fetch%20Data.dart';
import 'package:easy_apps/Screens/Account%20Page.dart';
import 'package:easy_apps/Screens/Create%20New%20App.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Order Details.dart';

class Photo_Url{
  static var PhotoURL = null ;
}
class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  Update_Profile(profile){
    if(profile == null){
      print("Profile Photo Got Null");
    }else if(profile != null){
        setState(() {
          Show_User_Profile = true;
        });
    }
  }
  bool Show_User_Profile = false;
  var size,height,width ;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: Get_User_Apps(context),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child:SpinKitFadingCircle(color: Colors.blueAccent,),);

          }else if(snapshot.hasError){
            return Center(child: Text("An Error Occurred... Please Try Again Later",style: GoogleFonts.raleway(fontSize: 24),),);
          }else{
            return RefreshIndicator(
              onRefresh: (){
               return Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Home_Screen()), (route) => false);
              },
              child: Column(
                children: [
              Container(
                child: Stack(
                  children: [
                    SafeArea(child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text('${snapshot.data["Owner"]}',style: GoogleFonts.acme(fontSize: 20),),
                      ),

                    )),
                    SafeArea(child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 15,left: 10),
                          child: Container(
                              height: 50,
                              width: 50,
                              child: Image.asset("assets/Easy Apps.png",fit: BoxFit.cover,))),
                    )
                    ),
                    SafeArea(child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10),
                          child: Container(
                              height: 50,
                              width: 50,
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Account_Page(Name: snapshot.data["Owner"],)));
                                },
                                child:snapshot.data["PhotoURL"] != null
                                    ?Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: CircleAvatar(
                                      minRadius: 30,
                                      backgroundImage: MemoryImage(base64Decode(Photo_Url.PhotoURL))
                                  ),
                                )
                                    :Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.transparent,
                                  child: Center(child: Icon(Icons.account_circle,size: 30,color: Colors.blue,)),
                                ),
                              ))),
                    )
                    ),
                  ],
                ),
              ),

                  SizedBox(height: 30,),
                  Divider(color: Colors.black,),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      SizedBox(width: 5,),
                      Text("My Apps",style: GoogleFonts.quicksand(),),
                      SizedBox(width: 6,),
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 3,)
                    ],
                  ),
                  SizedBox(height: 10,),

                  Expanded(
                    child: FutureBuilder(
                      future: Get_User_app_List(),
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting){
                          return Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: Center(child:SpinKitRing(color: Colors.blue,lineWidth: 2,),),
                          );

                          }else if(snapshot.hasError){
                          return Center(child: Text("An Error Occurred... Please Try Again Later",style: GoogleFonts.raleway(fontSize: 24),),);
                          }else{
                            return Column(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (BuildContext context,index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Order_Details(created_at: snapshot.data[index.toInt()]["Created_at"],app_owner: snapshot.data[index.toInt()]["App Owner"],apple: snapshot.data[index.toInt()]["Apple"],android: snapshot.data[index.toInt()]["Android"],app_name: snapshot.data[index.toInt()]["App Name"],mac: snapshot.data[index.toInt()]["Mac"],credit: snapshot.data[index.toInt()]["Credit"],contact_email: snapshot.data[index.toInt()]["Email"],help_support_mail: snapshot.data[index.toInt()]["Help & Support Email"],screen: snapshot.data[index.toInt()]["Screens"],description: snapshot.data[index.toInt()]["App Description"],linux: snapshot.data[index.toInt()]["Linux"],windows: snapshot.data[index.toInt()]["Windows"],phone_number: snapshot.data[index.toInt()]["Phone Number"],logo: snapshot.data[index.toInt()]["App Logo"],)));
                                            },
                                            child: Container(
                                              height: 200,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  border: Border.all(),
                                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                              ),
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.topCenter,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(18.0),
                                                      child: Text(
                                                        snapshot.data[index.toInt()]["App Name"],
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(fontSize: 34,fontWeight: FontWeight.w200,),),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(18.0),
                                                        child: Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Container(
                                                            height: 80,
                                                            width: 100,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              border: Border.all()
                                                            ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Image(
                                                              image: MemoryImage(base64Decode(snapshot.data[index.toInt()]["App Logo"])),
                                                            ),
                                                          ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 6,),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            child: Padding(
                                                              padding: const EdgeInsets.only(top: 40),
                                                              child: Text(
                                                                  "App Owner = ${snapshot.data[index.toInt()]["App Owner"]}",
                                                                style: GoogleFonts.ubuntu(),
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                            ),
                                                            width: width/2,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "Description = ",
                                                                style: GoogleFonts.ubuntu(),
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                              TextButton(
                                                                onPressed: (){
                                                                  Alert(
                                                                    context: context,
                                                                    type: AlertType.info,
                                                                    title: "App Description",
                                                                    desc: "${snapshot.data[index.toInt()]["App Description"]}",
                                                                    buttons: [
                                                                      DialogButton(
                                                                        child: Text(
                                                                          "close",
                                                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                                                        ),
                                                                        onPressed: () => Navigator.pop(context),
                                                                        color: Color.fromRGBO(0, 179, 134, 1.0),
                                                                        radius: BorderRadius.circular(0.0),
                                                                      ),
                                                                    ],
                                                                  ).show();
                                                                },
                                                                child: Text("view"),
                                                              )
                                                            ],
                                                          ),
                                                          Text(
                                                            "Total Cost = ₹${snapshot.data[index.toInt()]["Total Cost"]}",
                                                            style: GoogleFonts.ubuntu(),
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Align(
                                                    alignment: Alignment.bottomCenter,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: LinearPercentIndicator( //leaner progress bar
                                                        animation: true,
                                                        animationDuration: 1000,
                                                        lineHeight: 20.0,
                                                        percent: snapshot.data[index.toInt()]["Percent Complete"],
                                                        center: Text(
                                                          "${snapshot.data[index.toInt()]["Percent Complete Text"]}% Complete",
                                                          style: TextStyle(
                                                              fontSize: 12.0,
                                                              letterSpacing: 1,
                                                              fontWeight: FontWeight.w300,
                                                              color: Colors.black),
                                                        ),
                                                        linearStrokeCap: LinearStrokeCap.roundAll,
                                                        progressColor: Colors.blue[400],
                                                        backgroundColor: Colors.grey[300],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },),
                                  ),
                                ),
                                DialogButton(
                                    child: Text("Create New App",style: GoogleFonts.raleway(fontSize: 24,color: Colors.white)), onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Create_New_App()));
                                },
                                  height: 50,
                                  color: Colors.purpleAccent,
                                )

                              ],
                            );
                          }
    }),
                  ),

                ],
              ),
            );
          }
        },),
    );
  }
}

class No_Data_Home_Screen extends StatefulWidget {
  const No_Data_Home_Screen({Key? key, this.Name, this.PhotoURL}) : super(key: key);
final Name ;
final PhotoURL ;
  @override
  State<No_Data_Home_Screen> createState() => _No_Data_Home_ScreenState();
}


class _No_Data_Home_ScreenState extends State<No_Data_Home_Screen> {

  Change_Bool(profile){
    if(profile == ""){

    }else {
      if(profile == null){

      }else {
        setState(() {
          Show_User_Profile = true;
        });
      }
    }
  }
  bool Show_User_Profile = false;
  @override
  Widget build(BuildContext context) {
    Change_Bool(widget.PhotoURL);
    return RefreshIndicator(
      onRefresh: (){
        return Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Home_Screen()), (route) => false);
      },
      child: Center(
        child: Scaffold(
          body: Container(
            color: Colors.white,
            child: Stack(
              children: [
                SafeArea(child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(widget.Name,style: GoogleFonts.acme(fontSize: 20),),
                  ),

                )),
                SafeArea(child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15,left: 10),
                    child: Container(
                        height: 50,
                        width: 50,
                        child: Image.asset("assets/Easy Apps.png",fit: BoxFit.cover,))),
                  )
                ),
                SafeArea(child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 10,left: 10),
                      child: Container(
                          height: 50,
                          width: 50,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Account_Page(Name: widget.Name,)));
                            },
                            child:Show_User_Profile
                            ?Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: CircleAvatar(
                                  minRadius: 30,
                                  backgroundImage: MemoryImage(base64Decode(widget.PhotoURL))
                              ),
                            )
                            :Container(
                              height: 50,
                              width: 50,
                              color: Colors.transparent,
                              child: Center(child: Icon(Icons.account_circle,size: 30,color: Colors.blue,)),
                            ),
                          ))),
                )
                ),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Create_New_App()));
                    },
                    child: Container(
                      height: 80,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(40))
                      ),
                      child: Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Icon(Icons.add,color: Colors.redAccent,size: 44,),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text("CREATE NEW APP",style: GoogleFonts.raleway(fontSize: 24,color: Colors.blue),),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


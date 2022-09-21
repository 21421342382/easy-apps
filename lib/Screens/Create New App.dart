import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:easy_apps/Screens/Home%20Screen.dart';
import 'package:easy_apps/Screens/Pay&Confirm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Create_New_App extends StatefulWidget {
  const Create_New_App({Key? key}) : super(key: key);

  @override
  State<Create_New_App> createState() => _Create_New_AppState();
}

class _Create_New_AppState extends State<Create_New_App> {
  bool Show_Text = false;
  bool IsEnable = false;
  bool Photo = false;
  var PhotoURL = null;
  TextEditingController app_name = new TextEditingController();
  TextEditingController description = new TextEditingController();
  TextEditingController help_support_mail = new TextEditingController();
  TextEditingController credited_to = new TextEditingController();
  TextEditingController app_owner_name = new TextEditingController();
  final _key = GlobalKey<FormState>();
  final _key1 = GlobalKey<FormState>();
  final _key2 = GlobalKey<FormState>();
  final _key3 = GlobalKey<FormState>();
  final _key4 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top : 20),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text("Create New App",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 34,letterSpacing: 2),),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                  width: 250,
                  child: Image.asset("assets/1.png")),
                    Photo
                    ?Column(
                    children: [
                    Center(
                    child: Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10),
                        ),
                        border: Border.all()
                      ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image(
                        image: MemoryImage(base64Decode(PhotoURL)),
                      ),
                    )
                    ),
                    ),
                    SizedBox(height: 10,),
                    TextButton(onPressed: ()async{
                      var _cmpressed_image;
                    final Image = await ImagePicker().pickImage(source: ImageSource.gallery);
                          if(Image!=null){
                          var _cmpressed_image;
                          try {
                          _cmpressed_image = await FlutterImageCompress.compressWithFile(
                          Image.path,
                          format: CompressFormat.heic,
                          quality: 70

                          );
                          var decoded = base64Encode(_cmpressed_image);
                          print("This Is The Decoded Image");
                          setState(() {
                            Photo = true;
                            PhotoURL = decoded;
                          });
                          } catch (e) {
                          _cmpressed_image = await FlutterImageCompress.compressWithFile(
                          Image.path,
                          format: CompressFormat.jpeg,
                          quality: 70
                          );
                          var decoded = base64Encode(_cmpressed_image);
                          print("This Is The Decoded Image" + decoded);
                          setState(() {
                            PhotoURL = decoded;
                          });
                          }}
                    }, child: Text("Change")),
                    ],
                    )
                        :Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8),
                    child: InkWell(
                    onTap: ()async{
                      var _cmpressed_image;
                      final Image = await ImagePicker().pickImage(source: ImageSource.gallery);
                      if(Image!=null){
                        var _cmpressed_image;
                        try {
                          _cmpressed_image = await FlutterImageCompress.compressWithFile(
                              Image.path,
                              format: CompressFormat.heic,
                              quality: 70

                          );
                          var decoded = base64Encode(_cmpressed_image);
                          print("This Is The Decoded Image");
                          setState(() {
                            Photo = true;
                            PhotoURL = decoded;
                          });
                        } catch (e) {
                          _cmpressed_image = await FlutterImageCompress.compressWithFile(
                              Image.path,
                              format: CompressFormat.jpeg,
                              quality: 70
                          );
                          var decoded = base64Encode(_cmpressed_image);
                          print("This Is The Decoded Image" + decoded);
                          setState(() {
                            Photo = true ;
                            PhotoURL = decoded;
                          });
                        }}
                    },
                    child: Container(
                    height: 100,
                    width: 340,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    border: Border.all()
                    ),
                    child: Row(
                    children: [
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                    height: 98,
                    width: 60,
                    child: Center(
                    child: Icon(Icons.add_a_photo),
                    ),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all()
                    ),
                    ),
                    ),
                    SizedBox(
                    width: 50,
                    ),
                    Text("Add a Logo",style:GoogleFonts.workSans(fontSize: 15),),


                    ],
    ),
    ),
    ),
    ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _key,
                  child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: app_name,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        labelText: "App Name",
                        hintText: "App Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Required";
                      }else{
                        return null;
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _key1,
                  child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    minLines: 1,
                    maxLines: 100,  // allow user to enter 5 line in textfield
                    keyboardType: TextInputType.multiline,  // user keyboard will have a button to move cursor to next line
                    controller: description,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        labelText: "Description",
                        hintText: "Description of your App",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Required";
                      }else{
                        return null;
                      }
                    },
                  ),
                ),
              ),
              //SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _key2,
                  child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: help_support_mail,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        labelText: "Help & Support Mail",
                        hintText: "Help & Support Mail",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Required";
                      }else{
                        return null;
                      }
                    },
                  ),
                ),
              ),
              //SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _key3,
                  child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: credited_to,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        labelText: "Credited to",
                        hintText: "Credited to",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Required";
                      }else{
                        return null;
                      }
                    },
                  ),
                ),
              ),
              //SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _key4,
                  child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: app_owner_name,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        labelText: "App Owner Name",
                        hintText: "App Owner Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Required";
                      }else{
                        return null;
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: InkWell(
                  onTap: (){
                    if(_key.currentState!.validate()){
                      print("Key Validated");
                      if(_key1.currentState!.validate()){
                        print("Key1 Validated");
                        if(_key2.currentState!.validate()){
                          print("Key2 Validated");
                          if(_key3.currentState!.validate()){
                            print("Key3 Validated");
                            if(_key4.currentState!.validate()){
                              print("Key4 Validated");
                              print("All Keys Validated");
                              if(Photo == false){
                                showTopSnackBar(
                                  context,
                                  CustomSnackBar.error(
                                    message:
                                    "Something went wrong. Please add App logo",
                                  ),
                                );
                              }else{
                                print("Got Success");
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page2(logo: PhotoURL,app_name: app_name.text,description: description.text,help_and_support_email: help_support_mail.text,credited_to: credited_to.text,app_owner_name: app_owner_name.text,)));
                              }
                            }else{
                              print("Key 4 Not Validated");
                            }
                          }else{
                            print("Key 3 Not Validated");
                          }
                        }else{
                          print("Key 2 Not Validated");
                        }
                      }else{
                        print("Key1 Not Validated");
                      }
                    }else{
                      print("Key Not Validated");
                    }
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(),
                      color: Colors.greenAccent
                    ),
                  child: Center(child: Text("NEXT",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w300,letterSpacing: 2),),),
                  ),
                ),
              )
            ],),
        ),
      ),

    );

  }
  }




//############################################################################################################
//######################################## Page 2 ############################################################
//############################################################################################################

class Page2 extends StatefulWidget {
  const Page2({Key? key, this.logo, this.description, this.help_and_support_email, this.credited_to, this.app_owner_name, this.app_name}) : super(key: key);
final logo;
final description;
final help_and_support_email;
final credited_to;
final app_name;
final app_owner_name;
  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  bool windows = false;
  bool mac = false;
  bool linux = false;
  bool android = false;
  bool apple = false;
  final _key = GlobalKey<FormState>();
  final _key1 = GlobalKey<FormState>();
  int _n = 0;
  TextEditingController phone_number = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController screens = new TextEditingController();
  void minus() {
    setState(() {
      if (_n != 0)
        _n--;
    });
  }
  void add() {
    setState(() {
      _n++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("App Details",style : GoogleFonts.poppins(fontSize: 34,fontWeight: FontWeight.w300,letterSpacing: 2),),
                  ),
                ),
              ),
              //SizedBox(height: 20,),
              Container(
                  width: 250,
                  child: Image.asset("assets/2.png")),
              Row(
                children: [
                  SizedBox(width: 5,),
                  Text("Platforms",style: GoogleFonts.quicksand(),),
                  SizedBox(width: 6,),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 3,)
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Windows",style: GoogleFonts.dmSans(),),
                  ),
                  Flexible(fit: FlexFit.tight, child: SizedBox()),
                  Expanded(
                    child: FlutterSwitch(
                      width: 75.0,
                      height: 35.0,
                      valueFontSize: 15.0,
                      toggleSize: 25.0,
                      value: windows,
                      borderRadius: 30.0,
                      //padding: 8.0,
                      showOnOff: true,
                      onToggle: (val) {
                      setState(() {
                      windows = val;
                      });
                      },
                      ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Mac",style: GoogleFonts.dmSans(),),
                  ),
                  Flexible(fit: FlexFit.tight, child: SizedBox()),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: FlutterSwitch(
                        width: 75.0,
                        height: 35.0,
                        valueFontSize: 15.0,
                        toggleSize: 25.0,
                        value: mac,
                        borderRadius: 30.0,
                        //padding: 8.0,
                        showOnOff: true,
                        onToggle: (val) {
                          setState(() {
                            mac = val;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Linux",style: GoogleFonts.dmSans(),),
                  ),
                  Flexible(fit: FlexFit.tight, child: SizedBox()),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: FlutterSwitch(
                        width: 75.0,
                        height: 35.0,
                        valueFontSize: 15.0,
                        toggleSize: 25.0,
                        value: linux,
                        borderRadius: 30.0,
                        //padding: 8.0,
                        showOnOff: true,
                        onToggle: (val) {
                          setState(() {
                            linux = val;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Android",style: GoogleFonts.dmSans(),),
                  ),
                  Flexible(fit: FlexFit.tight, child: SizedBox()),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: FlutterSwitch(
                        width: 75.0,
                        height: 35.0,
                        valueFontSize: 15.0,
                        toggleSize: 25.0,
                        value: android,
                        borderRadius: 30.0,
                        //padding: 8.0,
                        showOnOff: true,
                        onToggle: (val) {
                          setState(() {
                            android = val;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Apple",style: GoogleFonts.dmSans(),),
                  ),
                  Flexible(fit: FlexFit.tight, child: SizedBox()),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 11),
                      child: FlutterSwitch(
                        width: 75.0,
                        height: 35.0,
                        valueFontSize: 15.0,
                        toggleSize: 25.0,
                        value: apple,
                        borderRadius: 30.0,
                        //padding: 8.0,
                        showOnOff: true,
                        onToggle: (val) {
                          setState(() {
                            apple = val;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            SizedBox(height: 20,),
              Divider(color: Colors.black,),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 5,),
                  Text("Contact Details",style: GoogleFonts.quicksand(),),
                  SizedBox(width: 6,),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 3,)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                 key: _key,
                  child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: phone_number,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        labelText: "Phone Number",
                        hintText: "Phone Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Required";
                      }else{
                        return null;
                      }
                    },
                  ),
                ),
              ),
              Text(
                "We Will Make a Phone Call on This Number Within 1hour",
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _key1,
                  child: TextFormField(
                    style: TextStyle(color: Colors.black),
                   controller: email,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        labelText: "Contact Email",
                        hintText: "Contact Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Required";
                      }else{
                        return null;
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.black,),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 5,),
                  Text("Screens",style: GoogleFonts.quicksand(),),
                  SizedBox(width: 6,),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 3,)
                ],
              ),
              SizedBox(height: 20,),
              Container(
                child:  Center(
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                       FloatingActionButton(
                        onPressed: add,
                        child:  Icon(Icons.add, color: Colors.black,),
                        backgroundColor: Colors.white,),

                       TextButton(onPressed: (){
                        print("Button Pressed");
                        Alert(
                            context: context,
                            title: "",
                            content: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: screens,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.numbers),
                                    labelText: 'Enter Manually',
                                  ),
                                ),
                              ],
                            ),
                            buttons: [
                              DialogButton(
                                onPressed: (){
                                  print(screens.text);
                                  if(screens.text == ""){
                                    Navigator.pop(context);
                                  }else{
                                    setState(() {
                                      _n = int.parse(screens.text) ;
                                    });
                                    Navigator.pop(context);
                                  }
                                  } ,
                                child: Text(
                                  "ok",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                              )
                            ]).show();
                      }, child: Text('$_n',
                          style: new TextStyle(fontSize: 34.0))),

                      new FloatingActionButton(
                        onPressed: minus,
                        child: Icon(Icons.remove,color: Colors.black,),
                        backgroundColor: Colors.white,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,)
            ,Row(
              children: [
                DialogButton(
                    width: 150,
                    color: Colors.grey,
                    child: Text("Back",style: TextStyle(fontWeight: FontWeight.w300,letterSpacing: 2)), onPressed: (){
                  Navigator.of(context).pop();
                }),
                SizedBox(width: 5,),
                Expanded(
                  child: DialogButton(
                      width: 150,
                      height: 50,
                      color: Colors.blueAccent,
                      child: Text("Next",style: TextStyle(fontWeight: FontWeight.w300,letterSpacing: 2,fontSize: 24),), onPressed: (){
                    print("Routee");
                    if(_key.currentState!.validate()){
                      if(_key1.currentState!.validate()){
                        if(_n == 0){
                          showTopSnackBar(
                            context,
                            CustomSnackBar.error(
                              message:
                              "Something went wrong. Screen can't be 0",
                            ),
                          );
                        }else{
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page3(logo: widget.logo, windows: windows,mac: mac,linux: linux,android: android,apple: apple,phone_number: phone_number.text,contact_email: email.text,screen: _n,app_name: widget.app_name,app_owner: widget.app_owner_name,help_support_mail: widget.help_and_support_email,description: widget.description,credit: widget.credited_to,)));
                        }
                      }
                    }

                  }),
                ),
              ],
            )
            ],
          ),
        ),
      ),
    );
  }
}



//############################################################################################################
//######################################## Page 3 ############################################################
//############################################################################################################

class Page3 extends StatefulWidget {
  const Page3({Key? key, this.logo, this.app_name, this.description, this.help_support_mail, this.credit, this.app_owner, required this.windows, required this.mac, required this.linux, required this.android, required this.apple, this.phone_number, this.contact_email, this.screen}) : super(key: key);
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
  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print("Yay!... Payment Successfully");
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Pay_Confirm(logo: widget.logo, windows: widget.windows,mac:widget.mac,linux: widget.linux,android: widget.android,apple: widget.apple,phone_number: widget.phone_number,contact_email: widget.contact_email,screen: widget.screen,app_name: widget.app_name,app_owner: widget.app_owner,help_support_mail: widget.help_support_mail,description: widget.description,credit: widget.credit,)));

  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("Payment Faailed ");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Pay_Confirm(logo: widget.logo, windows: widget.windows,mac:widget.mac,linux: widget.linux,android: widget.android,apple: widget.apple,phone_number: widget.phone_number,contact_email: widget.contact_email,screen: widget.screen,app_name: widget.app_name,app_owner: widget.app_owner,help_support_mail: widget.help_support_mail,description: widget.description,credit: widget.credit,)));

    // Do something when an external wallet is selected
  }
  var _razorpay = Razorpay();
  Widget build(BuildContext context) {
    void initState(){

      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
      super.initState();

    };
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Confirm Details",style : GoogleFonts.poppins(fontSize: 34,fontWeight: FontWeight.w300,letterSpacing: 2),),
                  ),
                ),
              ),
              Container(
                  width: 250,
                  child: Image.asset("assets/3.png")),
              //SizedBox(height: 20,),
              Divider(color: Colors.black,),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("App Logo",style: GoogleFonts.arimaMadurai(fontSize: 24,),),
                  ),
                  Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
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
                              image:  MemoryImage(base64Decode(widget.logo)),
                            ),
                          ),
                          ),
                        ),
                      ))
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("App Name",style: GoogleFonts.arimaMadurai(fontSize: 24,),),
                  ),
                  Expanded(child: Icon(Icons.remove)),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(widget.app_name,style: GoogleFonts.arimaMadurai(fontSize: 24),)),
                  ))
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("App Description",style: GoogleFonts.arimaMadurai(fontSize: 24,),),
                  ),
                  Expanded(child: Icon(Icons.remove)),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: (){
                          Alert(
                            context: context,
                            //style: ,
                            type: AlertType.info,
                            title: "Description",
                            desc: widget.description,
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
                        },child: Text("View"),) ),
                  ))
                ],
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.black,),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 5,),
                  Text("Help & Support Mail",style: GoogleFonts.quicksand(),),
                  SizedBox(width: 6,),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 3,)
                ],
              ),
              SizedBox(height: 20,),
              Text(widget.help_support_mail,style: TextStyle(fontWeight: FontWeight.w300),),
              SizedBox(height: 20,),
              Divider(
                color: Colors.black,
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("Credit",style: GoogleFonts.arimaMadurai(fontSize: 24,),),
                  ),
                  Expanded(child: Icon(Icons.remove)),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(widget.credit,style: GoogleFonts.arimaMadurai(fontSize: 24),)),
                  ))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("App Owner",style: GoogleFonts.arimaMadurai(fontSize: 24,),),
                  ),
                  Expanded(child: Icon(Icons.remove)),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(widget.app_owner,style: GoogleFonts.arimaMadurai(fontSize: 24),)),
                  ))
                ],
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.black,),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 5,),
                  Text("Platforms",style: GoogleFonts.quicksand(),),
                  SizedBox(width: 6,),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 3,)
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("Windows",style: GoogleFonts.arimaMadurai(fontSize: 24,),),
                  ),
                  Expanded(child: Icon(Icons.remove)),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('${widget.windows}',style: GoogleFonts.arimaMadurai(fontSize: 24),)),
                  ))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("Mac",style: GoogleFonts.arimaMadurai(fontSize: 24,),),
                  ),
                  Expanded(child: Icon(Icons.remove)),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('${widget.mac}',style: GoogleFonts.arimaMadurai(fontSize: 24),)),
                  ))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("Linux",style: GoogleFonts.arimaMadurai(fontSize: 24,),),
                  ),
                  Expanded(child: Icon(Icons.remove)),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('${widget.linux}',style: GoogleFonts.arimaMadurai(fontSize: 24),)),
                  ))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("Android",style: GoogleFonts.arimaMadurai(fontSize: 24,),),
                  ),
                  Expanded(child: Icon(Icons.remove)),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('${widget.android}',style: GoogleFonts.arimaMadurai(fontSize: 24),)),
                  ))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("Apple",style: GoogleFonts.arimaMadurai(fontSize: 24,),),
                  ),
                  Expanded(child: Icon(Icons.remove)),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('${widget.apple}',style: GoogleFonts.arimaMadurai(fontSize: 24),)),
                  ))
                ],
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.black,),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 5,),
                  Text("Personal Details",style: GoogleFonts.quicksand(),),
                  SizedBox(width: 6,),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 3,)
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("Phone Number",style: GoogleFonts.arimaMadurai(fontSize: 24,),),
                  ),
                  Expanded(child: Icon(Icons.remove)),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('${widget.phone_number}',style: GoogleFonts.arimaMadurai(fontSize: 15),)),
                  ))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("Email",style: GoogleFonts.arimaMadurai(fontSize: 24,),),
                  ),
                  Expanded(child: Icon(Icons.remove)),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('${widget.contact_email}',style: GoogleFonts.arimaMadurai(fontSize: 10),)),
                  ))
                ],
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.black,),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 5,),
                  Text("Screens",style: GoogleFonts.quicksand(),),
                  SizedBox(width: 6,),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 3,)
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("Screens",style: GoogleFonts.arimaMadurai(fontSize: 24,),),
                  ),
                  Expanded(child: Icon(Icons.remove)),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('${widget.screen}',style: GoogleFonts.arimaMadurai(fontSize: 34),)),
                  ))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("Days To Complete",style: GoogleFonts.arimaMadurai(fontSize: 24,),),
                  ),
                  Expanded(child: Icon(Icons.remove)),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('${widget.screen + 10 }',style: GoogleFonts.arimaMadurai(fontSize: 34),)),
                  ))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("Total Cost",style: GoogleFonts.arimaMadurai(fontSize: 24,),),
                  ),
                  Expanded(child: Icon(Icons.remove)),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('₹${widget.screen * 999 }',style: GoogleFonts.arimaMadurai(fontSize: 34),)),
                  ))
                ],
              ),
              Row(
                children: [
                  DialogButton(
                      height: 50,
                      width: 100,
                      color: Colors.grey,
                      child: Text("Decilne",style: TextStyle(fontWeight: FontWeight.w300),), onPressed: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Home_Screen()), (route) => false);
                  }),
                  Expanded(
                    child: DialogButton(
                        height: 60,
                        color: Colors.blueAccent,
                        child: Text("Pay & Confirm",style: TextStyle(fontWeight: FontWeight.w300),), onPressed: (){
                      print("Pay & Confirm");
                      var options = {
                        'key': 'rzp_test_vg0CLmcePMl8SU',
                        'amount': (widget.screen*999)*100, //in the smallest currency sub-unit.
                        'name': widget.app_owner,
                        //'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
                        'description': widget.app_name,
                        //'timeout': 60, // in seconds
                        'prefill': {
                          'contact': widget.phone_number,
                          'email': widget.help_support_mail
                        }
                      };
                      _razorpay.open(options);
                      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
                      //print("Payment Sucessfull");
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Pay_Confirm(logo: widget.logo, windows: widget.windows,mac:widget.mac,linux: widget.linux,android: widget.android,apple: widget.apple,phone_number: widget.phone_number,contact_email: widget.contact_email,screen: widget.screen,app_name: widget.app_name,app_owner: widget.app_owner,help_support_mail: widget.help_support_mail,description: widget.description,credit: widget.credit,)));
                    }),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}






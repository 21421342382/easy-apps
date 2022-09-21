import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:email_launcher/email_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Order_Details extends StatefulWidget {
  const Order_Details({Key? key, this.logo, this.app_name, this.description, this.help_support_mail, this.credit, this.app_owner, required this.windows, required this.mac, required this.linux, required this.android, required this.apple, this.phone_number, this.contact_email, this.screen, this.created_at}) : super(key: key);
  final created_at;
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
  State<Order_Details> createState() => _Order_DetailsState();
}

class _Order_DetailsState extends State<Order_Details> {

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
                    child: Text("Order Details",style : GoogleFonts.poppins(fontSize: 34,fontWeight: FontWeight.w300,letterSpacing: 2),),
                  ),
                ),
              ),
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
                        child: AutoSizeText(
                            widget.app_name,
                          style: GoogleFonts.arimaMadurai(fontSize: 24),
                    maxLines: 1,
    )
                    ),
                  )
                  )
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("Created at",style: GoogleFonts.arimaMadurai(fontSize: 24,),),
                  ),
                  Expanded(child: Icon(Icons.remove)),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: AutoSizeText(
                        '${widget.created_at}',
                          style: GoogleFonts.arimaMadurai(fontSize: 24),
    maxLines: 1,
    )

                  ))),
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
              AutoSizeText(
                '${widget.help_support_mail}',
                style: TextStyle(fontWeight: FontWeight.w300),
                maxLines: 1,
              ),
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
                        child: AutoSizeText(
                          '${widget.credit}',
                          style: GoogleFonts.arimaMadurai(fontSize: 24),
                          maxLines: 1,
                        ),
                    )))
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
                        child: AutoSizeText(
                          '${widget.app_owner}',
                          style: GoogleFonts.arimaMadurai(fontSize: 24),
                          maxLines: 1,
                        ),

                    ),
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
                        child:AutoSizeText(
                        '${widget.contact_email}',
                          style: GoogleFonts.arimaMadurai(fontSize: 24),
                          maxLines: 1,
                        ),
                    ),
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
                        child:AutoSizeText(
                        '${widget.screen}',
                          style: GoogleFonts.arimaMadurai(fontSize: 34),
                          maxLines: 1,
                        ),

                        ),
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
                        child:AutoSizeText(
                        '${widget.screen + 10 }',
                          style: GoogleFonts.arimaMadurai(fontSize: 34),
                          maxLines: 1,
                        ),
                    )
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
                        child:AutoSizeText(
                        '₹${widget.screen * 999 }',
                          style: GoogleFonts.arimaMadurai(fontSize: 34),
                          maxLines: 1,
                        ),

                        ),
                  ))
                ],
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.black,),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 5,),
                  Text("Developer Contact",style: GoogleFonts.quicksand(),),
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
                    child: Text("Developer Email",style: GoogleFonts.arimaMadurai(fontSize: 24,),),
                  ),
                  Expanded(child: Icon(Icons.remove)),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () async{
                            Email email = Email(
                                to: ['letscodeindia384@gmail.com'],
                                subject: 'Need Help Regarding Application',
                                body: 'Hey There Developer ..  I need Some Help Related to my App .. Kindly response as soon as you get this Message'
                            );
                            await EmailLauncher.launch(email);
                          },
                          child : Text('Contact Developer ',style: GoogleFonts.arimaMadurai(fontSize: 15),))),
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: DialogButton(
                        height: 60,
                        color: Colors.blueAccent,
                        child: Text("Close",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 24,letterSpacing: 2),), onPressed: (){
                      print("Close Page");
                      Navigator.pop(context);
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

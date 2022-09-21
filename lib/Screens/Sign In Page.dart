import 'dart:convert';
import 'package:easy_apps/Screens/Login_Page.dart';
import 'package:easy_apps/Screens/OTP%20Verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Sign_In_Page extends StatefulWidget {
  const Sign_In_Page({Key? key}) : super(key: key);

  @override
  State<Sign_In_Page> createState() => _Sign_In_PageState();
}

class _Sign_In_PageState extends State<Sign_In_Page> {
  Get_OTP(email,name,password)async{
    final url = Uri.parse("https://email-verifer-harsh.herokuapp.com/?input="+'$email');
    print("This Is The Link - "+'$url');
    http.Response otp = await http.get(url);
    print(otp.body);
    final decoded_otp = jsonDecode(otp.body);
    print("Otp - "+ decoded_otp["OTP"]);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
        OTP_Verification(OTP: decoded_otp["OTP"],Email: email,Name: name,Password: password,)));
  }

  final _key = GlobalKey<FormState>();
  final _key1 = GlobalKey<FormState>();
  final _key2 = GlobalKey<FormState>();
  final controller_For_Name = new TextEditingController();
  final controller_For_Email = new TextEditingController();
  final controller_For_Password = new TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 30),
              child: Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _key,
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Required";
                                }else{
                                  return null;
                                }
                              },
                              controller: controller_For_Name,
                              style: TextStyle(color: Colors.white),
                              maxLength: 17,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Name",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Form(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              key: _key1,
                              child: TextFormField(
                                  validator: (value){
                                  if(value!.isEmpty){
                                  return "Required";
                                  }else{
                                  return null;
                                  }},
                                controller: controller_For_Email,

                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Form(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              key: _key2,
                              child: TextFormField(
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "Required";
                                  }else{
                                    return null;
                                  }
                                },
                                controller: controller_For_Password,
                                style: TextStyle(color: Colors.white),
                                obscureText: true,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {

                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login_Page()));
                                  },
                                  child: Text(
                                    'Log In',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Color(0xff4c505b),
                                        fontSize: 18),
                                  ),
                                  style: ButtonStyle(),
                                ),
                                Center(
                                  child:  isLoading
                                      ? SpinKitFoldingCube(color: Colors.black)
                                      :CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Color(0xff4c505b),
                                    child: IconButton(
                                        color: Colors.white,
                                        onPressed: () {
                                      final is_validate_form1 = _key.currentState!.validate();
                                        final is_validate_form2 = _key1.currentState!.validate();
                                      final is_validate_form3 = _key2.currentState!.validate();
                                        if(is_validate_form1){
                                        print("Validated");
                                        if(is_validate_form2){
                                        print("Validated");
                                        if(is_validate_form3){
                                          print("Validated");
                                          setState(() {
                                            isLoading = true;
                                          });
                                          print("This is Email - "+controller_For_Email.toString());
                                          try {
                                            Get_OTP(controller_For_Email.text.trim(),controller_For_Name.text,controller_For_Password.text);
                                          } on Exception catch (_) {
                                            print("throwing new error");
                                            showTopSnackBar(
                                              context,
                                              CustomSnackBar.error(
                                                message:
                                                "Something went wrong. Please try again later",
                                              ),
                                            );
                                            setState(() {
                                              isLoading = false;
                                            });
                                          }

                                        }else{
                                          print("Not Validated");
                                        }
                                        }else{
                                        print("Not Validated");
                                        }
                                        }else{
                                        print("Not Validated");
                                        }
    },

                                        icon: Icon(
                                          Icons.arrow_forward,
                                        )),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

